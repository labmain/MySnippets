class test {
    public static void main(String[] args) {
    //    int[] grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]];
    int[][] grid = {
        {3,0,8,4},
        {2,4,5,7},
        {9,2,6,3},
        {0,3,1,0}
    };
    int i = maxIncreaseKeepingSkyline(grid);
    System.out.println(i);

    }
    public static int maxIncreaseKeepingSkyline(int[][] grid) {
        int[] row = new int[grid.length];
        int[] column = new int[grid[0].length];

        for (int i = 0; i < grid.length; i ++) {
            for (int j = 0; j < grid[i].length; j ++) {
                if (grid[i][j] > row[i]) {
                    row[i] = grid[i][j];
                }
                if (grid[i][j] > column[j]) {
                    column[j] = grid[i][j];
                }
            }
        }

        int total = 0;
        for (int i = 0; i < grid.length; i ++) {
            for (int j = 0; j < grid[i].length; j ++) {
                if (row[i] > column[j]) {
                    if (grid[i][j] < column[j]) {
                        total += column[j] - grid[i][j];
                    }
                } else {
                    if (grid[i][j] < row[i]) {
                        total += row[i] - grid[i][j];
                    }
                }
            }
        }

        return total;
    }
    // 第三题
    public static int numJewelsInStones(String J, String S) {
        int count = 0;
        for (int i = 0; i < J.length(); i++) {
            char c = J.charAt(i);
            for (int j = 0; j < S.length(); j++) {
                char s = S.charAt(j);
                if (c == s) {
                    count ++;
                }
            }
        }
        return count;
    }

    // 第一题
    public static int[] twoSum(int[] nums, int target) {
        int[] a = {};
        for (int i = 0; i < nums.length; i++) {
            for (int j = 0; j < nums.length; j++) {
                if (i != j) {
                    int x = nums[i];
                    int y = nums[j];
                    if (x + y == target) {
                        int[] b = {i,j};
                        return b;
                    }
                }
            }
        }
        return a;
    }

    // 第二题
    public static String toLowerCase(String str) {
        char[] charStr = new char[str.length()];
        
        int abc = 'a' - 'A';
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c >= 'A' && c <= 'Z') {
                charStr[i] = (char)(c + abc);
            } else {
                charStr[i] = c;
            }
        }
        String ccc = String.valueOf(charStr);
        return ccc;
    }
}