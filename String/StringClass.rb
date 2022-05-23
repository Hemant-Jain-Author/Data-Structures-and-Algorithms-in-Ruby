require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

class Stringclass
    def initialize()
        #string text = "Hello, World!";
        str1 = "hello"
        str2 = "hello"
        str3 = "Hello"
        Console.WriteLine("str1 equals str2 :" + str1.Equals(str2))
        Console.WriteLine("str1 equals str3 :" + str1.Equals(str3))
    end

    def demo()
        str1 = "hello"
        str2 = "hello"
        str3 = "Hello"
        Console.WriteLine("str1 equals str2 :" + str1.Equals(str2))
        Console.WriteLine("str1 equals str3 :" + str1.Equals(str3))
    end

    def demo2()
        #string str;
        text = "Hello, World!"
        Console.WriteLine(text[7])
        array = text.ToCharArray()
        Console.WriteLine(text[7])
        arr = Array[System::Char].new(['H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!'])
        hello = System.String.new(arr)
        first = "Hello, "
        second = "World!"
        #String helloworld = first + second;
        helloworld = first + second
    end
end