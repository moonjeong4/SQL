using MySqlConnector;

namespace D19Lab1;

internal class Program
{
    private static string datadase = "lab1_survey";
    private static MySqlConnection conn;
    private static uint numQuestions = 0;

    static void Main(string[] args)
    {
        CreatDatabase();
        Console.WriteLine("Hello, please answer those" + numQuestions + " questions.");
        GatherSurvey();
        Console.WriteLine("Thank you!");

    }

    public static void CreatDatabase()
    {
        conn = new("Server=localhost; User ID=xxxxxx; Password=xxxxxx");

        conn.Open();

        using MySqlCommand creatDb = new($"CREATE DATABASE IF NOT EXISTS {datadase}", conn);
        creatDb.ExecuteNonQuery();

        using MySqlCommand cmdUseDb = new MySqlCommand($"USE {datadase}", conn);
        cmdUseDb.ExecuteNonQuery();

        using MySqlCommand creatTUser = new("CREATE TABLE IF NOT EXISTS `user` (userId INT UNSIGNED auto_increment NOT NULL,`first` varchar(100) NOT NULL,`last` varchar(100) NOT NULL,age INT UNSIGNED NOT NULL,`sex` varchar(100) NOT NULL,height FLOAT NOT NULL,CONSTRAINT user_pk PRIMARY KEY(userId))", conn);
        creatTUser.ExecuteNonQuery();

        using MySqlCommand creatTQuestion = new("CREATE TABLE IF NOT EXISTS question (questionId INT UNSIGNED auto_increment NOT NULL,question varchar(256) NOT NULL,CONSTRAINT question_pk PRIMARY KEY (questionId))", conn);
        creatTQuestion.ExecuteNonQuery();

        using MySqlCommand creatTAnswer = new("CREATE TABLE IF NOT EXISTS answer (answerId INT UNSIGNED auto_increment NOT NULL,userId INT UNSIGNED NOT NULL,questionId INT UNSIGNED NOT NULL,answer INT UNSIGNED NOT NULL,CONSTRAINT answer_pk PRIMARY KEY (answerId),CONSTRAINT answer_FK FOREIGN KEY (userId) REFERENCES lab1_survey.`user`(userId) ON DELETE RESTRICT ON UPDATE RESTRICT,CONSTRAINT answer_FK_1 FOREIGN KEY (questionId) REFERENCES lab1_survey.question(questionId) ON DELETE RESTRICT ON UPDATE RESTRICT)", conn);
        creatTAnswer.ExecuteNonQuery();

        using MySqlCommand cmdNumQuestion = new MySqlCommand("select count(questionId) from question", conn);
        numQuestions = Convert.ToUInt32(cmdNumQuestion.ExecuteScalar());

        if (numQuestions == 0)
        {
            List<string> questions = new()
            {
                "How much do you like Java?",
                "How much do you like c#?",
                "How much do you like SQL?"
            };

            foreach (var q in questions)
            {
                using MySqlCommand insertQuestion = new MySqlCommand("INSERT INTO question (`question`) VALUES (@q)", conn);
                insertQuestion.Parameters.AddWithValue("q", q);
                insertQuestion.ExecuteNonQuery();
            }

            numQuestions = (uint)questions.Count;
        }

        conn.Close();
    }

    public static void GatherSurvey()
    {
        using MySqlConnection conn = new("Server=localhost; User ID=root; Password=moon");

        conn.Open();

        using MySqlCommand cmdUseDb = new MySqlCommand($"USE {datadase}", conn);
        cmdUseDb.ExecuteNonQuery();

        Console.WriteLine("Enter your first name: ");
        var first = Console.ReadLine().Trim();
        Console.WriteLine("Enter your last name: ");
        var last = Console.ReadLine().Trim();
        Console.WriteLine("Enter your age: ");
        //var age = Int32.Parse(Console.ReadLine());
        uint age = uint.Parse(Console.ReadLine().Trim());
        Console.WriteLine("Enter your sex: ");
        //var sex = Console.ReadLine();
        char sex = Console.ReadLine().Trim().ToLower().ToCharArray()[0];
        Console.WriteLine("Enter your height in cm: ");
        //var
        float height = float.Parse(Console.ReadLine().Trim());

        using MySqlCommand InserUser = new("INSERT INTO `user` (`first`,`last`,age,sex,height) VALUES (@f,@l,@a,@s,@h)", conn);
        InserUser.Parameters.AddWithValue("f", first);
        InserUser.Parameters.AddWithValue("l", last);
        InserUser.Parameters.AddWithValue("a", age);
        InserUser.Parameters.AddWithValue("s", sex);
        InserUser.Parameters.AddWithValue("h", height);

        InserUser.ExecuteNonQuery();

        long userId = InserUser.LastInsertedId;

        using MySqlCommand cmdSelectQuestions = new MySqlCommand("select questionId, question from question", conn);
        var result = cmdSelectQuestions.ExecuteReader();

        List<(uint userId, uint questionId, uint answer)> answers = new();

        if (result != null)
        {
            while (result.Read())
            {
                Console.WriteLine(result.GetString(1) + " (1-5)");
                uint answer = uint.Parse(Console.ReadLine().Trim());

                answers.Add(((uint)userId, result.GetUInt32(0), answer));
            }
        }
        result.Close();

        foreach (var res in answers)
        {
            using MySqlCommand cmdInserAnswer = new("INSERT INTO answer (userId,questionId,answer) VALUES (@u,@q,@a)", conn);
            cmdInserAnswer.Parameters.AddWithValue("u", res.userId);
            cmdInserAnswer.Parameters.AddWithValue("q", res.questionId);
            cmdInserAnswer.Parameters.AddWithValue("a", res.answer);
            cmdInserAnswer.ExecuteNonQuery();
        }

        //Console.WriteLine("Enter your question: ");
        //var ques = Console.ReadLine();

        //using MySqlCommand InserQuestion = new("INSERT INTO lab1_survey.`question` (`question`) VALUES (@q)", conn);

        //InserQuestion.Parameters.AddWithValue("q", ques);
        //InserQuestion.ExecuteNonQuery();

        //using MySqlCommand cmd1 = new("select * from lab1_survey.`user`", conn);
        //using var result1 = cmd1.ExecuteReader();

        //while (result1.Read())
        //{
        //    Console.WriteLine("{0} {1} {2} {3} {4} {5}", result1.GetInt32(0), result1.GetString(1), result1.GetString(2), result1.GetInt32(3), result1.GetString(4), result1.GetInt32(5));
        //}
        //Console.WriteLine("\n");
        //conn.Close();

        //conn.Open();

        //using MySqlCommand cmd2 = new("select * from lab1_survey.`question`", conn);
        //using var result2 = cmd2.ExecuteReader();

        //while (result2.Read())
        //{
        //    Console.WriteLine("{0} {1}", result2.GetInt32(0), result2.GetString(1));
        //}
        //conn.Close();

        //conn.Open();

        //Console.WriteLine("Enter your user ID: ");
        //var ui = Int32.Parse(Console.ReadLine());
        //Console.WriteLine("Enter your question ID: ");
        //var qi = Int32.Parse(Console.ReadLine());
        //Console.WriteLine("Enter your answer(out of 5): ");
        //var a = Int32.Parse(Console.ReadLine());

        //using MySqlCommand InserAnswer = new("INSERT INTO lab1_survey.answer (userId,questionId,answer) VALUES (@u,@q,@a)", conn);
        //InserAnswer.Parameters.AddWithValue("u", ui);
        //InserAnswer.Parameters.AddWithValue("q", qi);
        //InserAnswer.Parameters.AddWithValue("a", a);
        //InserAnswer.ExecuteNonQuery();
    }
}