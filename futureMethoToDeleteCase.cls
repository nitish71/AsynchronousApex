//public class futureMethoToDeleteCase {
    
public class futureMethoToDeleteCase {

    // Future method for asynchronous processing
    @future
    public static void deleteWebCases() {
        try {
            // Query to get cases created through 'Web'
            List<Case> casesToDelete = [
                SELECT Id 
                FROM Case 
                WHERE Origin = 'Web'
            ];

            // Delete the cases
            if (!casesToDelete.isEmpty()) {
                delete casesToDelete;
            }

        } catch (Exception ex) {
            // Handle any exceptions
            System.debug('Error deleting cases: ' + ex.getMessage());
        }
    }
}


