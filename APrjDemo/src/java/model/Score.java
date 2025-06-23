package model;

public class Score {
    private String SID;
    private String SName;
    private String CID;
    private String CName;

    private double SmallTest1;
    private double SmallTest2;
    private double PracticeExam;
    private double ProgressTest1;
    private double ProgressTest2;
    private double FinalExam;
    private double totalPoint;

    public Score() {
    }

    public Score(String SID, String SName, String CID, String CName,
                 double ProgressTest1, double ProgressTest2, double SmallTest1, double SmallTest2,
                 double PracticeExam, double FinalExam) {
        this.SID = SID;
        this.SName = SName;
        this.CID = CID;
        this.CName = CName;
        this.ProgressTest1 = ProgressTest1;
        this.ProgressTest2 = ProgressTest2;
        this.SmallTest1 = SmallTest1;
        this.SmallTest2 = SmallTest2;
        this.PracticeExam = PracticeExam;
        this.FinalExam = FinalExam;
    }
    
    public Score(String SID, String SName, String CID, String CName,
                 double ProgressTest1, double ProgressTest2, double SmallTest1, double SmallTest2,
                 double PracticeExam, double FinalExam, double TotalPoint) {
        this.SID = SID;
        this.SName = SName;
        this.CID = CID;
        this.CName = CName;
        this.ProgressTest1 = ProgressTest1;
        this.ProgressTest2 = ProgressTest2;
        this.SmallTest1 = SmallTest1;
        this.SmallTest2 = SmallTest2;
        this.PracticeExam = PracticeExam;
        this.FinalExam = FinalExam;
        this.totalPoint = TotalPoint;
    }

    public String getSID() {
        return SID;
    }

    public String getSName() {
        return SName;
    }

    public String getCID() {
        return CID;
    }

    public String getCName() {
        return CName;
    }

    public double getSmallTest1() {
        return SmallTest1;
    }

    public double getSmallTest2() {
        return SmallTest2;
    }

    public double getPracticeExam() {
        return PracticeExam;
    }

    public double getProgressTest1() {
        return ProgressTest1;
    }

    public double getProgressTest2() {
        return ProgressTest2;
    }

    public double getFinalExam() {
        return FinalExam;
    }

    public double getTotalPoint() {
        return totalPoint;
    }

    public void setSID(String SID) {
        this.SID = SID;
    }

    public void setSName(String SName) {
        this.SName = SName;
    }

    public void setCID(String CID) {
        this.CID = CID;
    }

    public void setCName(String CName) {
        this.CName = CName;
    }

    public void setSmallTest1(double SmallTest1) {
        this.SmallTest1 = SmallTest1;
    }

    public void setSmallTest2(double SmallTest2) {
        this.SmallTest2 = SmallTest2;
    }

    public void setPracticeExam(double PracticeExam) {
        this.PracticeExam = PracticeExam;
    }

    public void setProgressTest1(double ProgressTest1) {
        this.ProgressTest1 = ProgressTest1;
    }

    public void setProgressTest2(double ProgressTest2) {
        this.ProgressTest2 = ProgressTest2;
    }

    public void setFinalExam(double FinalExam) {
        this.FinalExam = FinalExam;
    }

    public void setTotalPoint(double totalPoint) {
        this.totalPoint = totalPoint;
    }

     
    private void calculateTotalPoint() {
        try {
            this.totalPoint = (ProgressTest1 + ProgressTest2) * 0.10 +
                              (SmallTest1 + SmallTest2) * 0.05 +
                              PracticeExam * 0.30 +
                              FinalExam * 0.40;
        } catch (ArithmeticException e) {
            this.totalPoint = -99;
            System.out.println("The score of all courses is not complete.");
        }
    }

    @Override
    public String toString() {
        return "Score{" + "StudentID=" + SID + ", SName=" + SName +
                ", CourseID=" + CID + ", CourseName=" + CName +
                ", ProgressTest1=" + ProgressTest1 + ", ProgressTest2=" + ProgressTest2 +
                ", SmallTest1=" + SmallTest1 + ", SmallTest2=" + SmallTest2 +
                ", PracticeExam=" + PracticeExam + ", FinalExam=" + FinalExam +
                ", TotalPoint=" + totalPoint + '}';
    }
}
