import java.time.*;

public class Employee {
    private int employeeId;
    private String name;
    private String department;
    private double salary;
    private int age;
    private LocalDate joiningDate;
    private double rating;

    public Employee(int employeeId, String name, String department, double salary, int age, LocalDate joiningDate, double rating){
        this.employeeId = employeeId;
        this.name = name;
        this.department = department;
        this.salary = salary;
        this.age = age;
        this.joiningDate = joiningDate;
        this.rating = rating;
    }
    
    String getName(){
        return this.name;
    }

    Double getSalary(){
        return this.salary;
    }

    String getDepartment(){
        return this.department;
    }

    double getRating(){
        return this.rating;
    }
}

