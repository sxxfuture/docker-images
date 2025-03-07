public class healthcheck {
    public static void main(String[] args) throws java.lang.Throwable {
        System.exit(java.net.HttpURLConnection.HTTP_OK == ((java.net.HttpURLConnection) new java.net.URL(
                "http://localhost:9000/health/live")
                .openConnection()).getResponseCode() ? 0 : 1);
    }
}