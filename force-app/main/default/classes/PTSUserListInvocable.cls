public class PTSUserListInvocable { 
    @InvocableMethod (label='Get UserList')     //(apex tekı methodun flowun ıcın de gorunmesı ıcın kulanyrz ınvocable())
    public static void Getusers(){
       PTSUserList.getUserList();      
    }
}