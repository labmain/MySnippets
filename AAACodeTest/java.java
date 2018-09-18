class java implementation InterFAce {
    public static void main(String[] args) {
        System.out.print("Hello World!\n");
        // System.out.print(sum(1,1));
        // System.out.print(max(2,3));
        // System.out.print(getWeek(2));

        // String[] aaa = {"1","2","3","4"};
        // System.out.print(pringArray(aaa));
        //
        @override
        public void printStr() {
            // System.out.println("jInterFAce");
            // return "";
        }
        System.out.print(get100Sum(null));
    }
    public static int sum(int a, int b) {
        return a + b;
    }
    public static int max(int a, int b) {
        return a>b?a:b;
    }
    public static String getWeek(int a) {
        switch(a) {
            case 1:
            return "sdfd";
            case 2:
            return "2";
            default:
                return "123123";
        }
    }
    public static int get100Sum(InterFAce jjj){
        int sum100 = 0;
        for(int i = 1; i <= 100; i++) {
            sum100 +=i;
        }
        if (jjj != null) {
            jjj.printStr();
        }
        return sum100;
    }
    public static void pringArray(String[] array) {
        for (String str : array) {
            System.out.println(str);
        }
    }
}


interface InterFAce {
    public void printStr();
}
