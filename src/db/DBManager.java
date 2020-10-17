package db;

import javafx.geometry.Pos;

import java.sql.*;
import java.util.ArrayList;
    import static java.time.ZonedDateTime.now;


public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/aralasu?useUnicode=true&serverTimezone=UTC", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Users getUserByEmail(String email) {
        Users u = null;

        try {
            PreparedStatement statement = connection.prepareStatement("select * from users where email=? LIMIT 1 ");
            statement.setString(1, email);

            ResultSet set = statement.executeQuery();

            if (set.next()) {
                u = new Users(
                        set.getLong("id"),
                        set.getString("email"),
                        set.getString("password"),
                        set.getString("full_name"),
                        (Date) set.getDate("birth_date"),
                        set.getString("picture_url")
                );
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public static boolean addUser(Users user) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO users (id, email, password, full_name, birth_date, picture_url) VALUES (null,?,?,?,?,?) ");
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            java.util.Date utilStartDate = user.getBirthdate();
            Date sqlStartDate = new Date(utilStartDate.getTime());
            statement.setDate(4, (Date) user.getBirthdate());
            statement.setString(5, user.getPicture_url());

            rows = statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }


    public static ArrayList<Users> getAllUsers() {
        ArrayList<Users> userList = new ArrayList<Users>();
        try {
            PreparedStatement stat = connection.prepareStatement(" SELECT id, email, password, full_name, birth_date, picture_url FROM users");
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                userList.add(new Users(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        (Date) rs.getDate(5),
                        rs.getString(6)
                ));
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        return userList;
    }

    public static boolean deleteUser(Long id) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM users WHERE id = ?");

            statement.setLong(1, id);

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static Users getUser(Long id) {
        Users user = null;

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from users where id = ?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new Users(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        (Date) rs.getDate(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {
        }

        return user;
    }


    public static boolean saveUser(Users user) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE users SET email = ?, password = ?, full_name=?, birth_date=?, picture_url=? WHERE id = ?");
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            java.util.Date utilStartDate = user.getBirthdate();
            Date sqlStartDate = new Date(utilStartDate.getTime());
            statement.setDate(4, (Date) user.getBirthdate());
            statement.setString(5, user.getPicture_url());
            statement.setLong(6, user.getId());

            rows = statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static ArrayList<Posts> getAllPosts() {
        ArrayList<Posts> postList = new ArrayList<>();
        try {
            PreparedStatement stat = connection.prepareStatement(" SELECT p.id,p.author_id,p.title,p.short_content,p.content,p.post_date ,u.id,u.email,u.password,u.full_name,u.picture_url,u.birth_date " +
                    "                    from posts p " +
                    "                    inner join users u on p.author_id = u.id " +
                    "order by post_date asc ");
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                postList.add(new Posts(
                        rs.getLong("id"),
                        new Users(
                                rs.getLong("id"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("full_name"),
                                rs.getDate("birth_date"),
                                rs.getString("picture_url")
                        ),
                        rs.getString("title"),
                        rs.getString("short_content"),
                        rs.getString("content"),
                        rs.getTimestamp("post_date")
                ));
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        return postList;
    }


    public static boolean addPost(Posts post) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO posts (id, author_id, title, short_content, content, post_date) VALUES (null,?,?,?,?,NOW()) ");
            statement.setLong(1, post.getAuthor().getId());
            statement.setString(2, post.getTitle());
            statement.setString(3, post.getShort_content());
            statement.setString(4, post.getContent());

            rows = statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static Posts getPostById(Long id) {
        Posts p = null;

        try {
            PreparedStatement statement = connection.prepareStatement(" SELECT p.id,p.author_id,p.title,p.short_content,p.content,p.post_date ,u.id,u.email,u.password,u.full_name,u.picture_url,u.birth_date " +
                    "   from posts p " +
                    "  inner join users u on p.author_id = u.id " +
                    "where p.id=? ");
            statement.setLong(1, id);

            ResultSet set = statement.executeQuery();

            if (set.next()) {
                p = new Posts(
                        set.getLong("id"),
                        new Users(
                                set.getLong("id"),
                                set.getString("email"),
                                set.getString("password"),
                                set.getString("full_name"),
                                set.getDate("birth_date"),
                                set.getString("picture_url")
                        ),
                        set.getString("title"),
                        set.getString("short_content"),
                        set.getString("content"),
                        set.getTimestamp("post_date")
                );
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public static ArrayList<Posts> getPostByUserId(Long id) {
        ArrayList<Posts> posts = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(" SELECT p.id,p.author_id,p.title,p.short_content,p.content,p.post_date ,u.id,u.email,u.password,u.full_name,u.picture_url,u.birth_date " +
                    "   from posts p " +
                    "  inner join users u on p.author_id = u.id " +
                    "where u.id=? ");
            statement.setLong(1, id);

            ResultSet set = statement.executeQuery();

            while (set.next()) {
                posts.add(new Posts(
                        set.getLong("id"),
                        new Users(
                                set.getLong("id"),
                                set.getString("email"),
                                set.getString("password"),
                                set.getString("full_name"),
                                set.getDate("birth_date"),
                                set.getString("picture_url")
                        ),
                        set.getString("title"),
                        set.getString("short_content"),
                        set.getString("content"),
                        set.getTimestamp("post_date")
                ));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    public static boolean deletePost(Long id) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM posts WHERE id = ?");

            statement.setLong(1, id);

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static boolean savePost(Posts posts) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE posts SET title = ?, short_content = ?, content=? WHERE id = ?");
            statement.setString(1, posts.getTitle());
            statement.setString(2, posts.getShort_content());
            statement.setString(3, posts.getContent());
            statement.setLong(4, posts.getId());

            rows = statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static ArrayList<Users> getAllFriends(Long id) {
        ArrayList<Users> usersList = new ArrayList<>();
        try {
            PreparedStatement stat = connection.prepareStatement("SELECT us.id,\n" +
                    "       us.email,\n" +
                    "       us.password,\n" +
                    "       us.full_name,\n" +
                    "       us.picture_url,\n" +
                    "       us.birth_date\n" +
                    "from users u\n" +
                    "         inner join friends f on u.id = f.friend_id\n" +
                    "inner join users us on us.id=f.user_id\n" +
                    "where u.id=?\n" +
                    "order by full_name asc ");

            stat.setLong(1, id);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                usersList.add(new Users(
                        rs.getLong("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getDate("birth_date"),
                        rs.getString("picture_url")
                ));
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        try {
            PreparedStatement stat = connection.prepareStatement("SELECT us.id,\n" +
                    "       us.email,\n" +
                    "       us.password,\n" +
                    "       us.full_name,\n" +
                    "       us.picture_url,\n" +
                    "       us.birth_date\n" +
                    "from users u\n" +
                    "         inner join friends f on u.id = f.user_id\n" +
                    "inner join users us on us.id=f.friend_id\n" +
                    "where u.id=?\n" +
                    "order by full_name asc ");

            stat.setLong(1, id);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                usersList.add(new Users(
                        rs.getLong("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getDate("birth_date"),
                        rs.getString("picture_url")
                ));
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        return usersList;
    }

    public static int getAge(Long id) {
        int userAge = 0;

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT birth_date, TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age FROM users where id = " + id);
//            ps.setDate(1, (Date) birthdate);
            ResultSet rs = ps.executeQuery();
            System.out.println("age:+" + rs);
            if (rs.next()) {
                userAge = rs.getInt(2);
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userAge;
    }

    public static ArrayList<Users> findFriend(String myValue) {
        ArrayList<Users> friends = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select *\n" +
                    "from users\n" +
                    "where UPPER (full_name) LIKE ? ");
            statement.setString(1, "%" + myValue.toUpperCase() + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                friends.add(new Users(
                        rs.getLong("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getDate("birth_date"),
                        rs.getString("picture_url")
                ));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return friends;
    }

    public static boolean isRequest(Long idUser, Long idFriend) {
        boolean isFriend = false;
        try {
            PreparedStatement statement = connection.prepareStatement("select *\n" +
                    "from friends_requests\n" +
                    "where user_id = ?\n" +
                    "    and request_sender_id = ? ");
            statement.setLong(1, idUser);
            statement.setLong(2, idFriend);

            ResultSet set = statement.executeQuery();
            if (set != null) {
                isFriend = true;
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isFriend;
    }

    public static boolean isFriend(Long idUser, Long idFriend) {
        boolean isFriend = false;
        try {
            PreparedStatement statement = connection.prepareStatement("select *\n" +
                    "from friends\n" +
                    "where user_id = ?\n" +
                    "  and friend_id = ?\n" +
                    "or user_id=?\n" +
                    "and friend_id=? ");
            statement.setLong(1, idUser);
            statement.setLong(2, idFriend);
            statement.setLong(3, idFriend);
            statement.setLong(4, idUser);

            ResultSet set = statement.executeQuery();
            if (set != null) {
                isFriend = true;
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isFriend;
    }


    public static ArrayList<Users> getAllRequests(Long id) {
        ArrayList<Users> requestsList = new ArrayList<>();
        try {
            PreparedStatement stat = connection.prepareStatement("select u.id, u.email, u.password, u.full_name, u.birth_date, u.picture_url\n" +
                    " from friends_requests f INNER JOIN users u on f.user_id = u.id\n" +
                    " WHERE f.request_sender_id = ?");
            stat.setLong(1, id);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                requestsList.add(new Users(
                                rs.getLong("id"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("full_name"),
                                rs.getDate("birth_date"),
                                rs.getString("picture_url")
                        )
                );
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        return requestsList;
    }

    public static ArrayList<Users> getMySend(Long id) {
        ArrayList<Users> requestsList = new ArrayList<>();
        try {
            PreparedStatement stat = connection.prepareStatement("select u.id, u.email, u.password, u.full_name, u.birth_date, u.picture_url\n" +
                    " from friends_requests f INNER JOIN users u on f.request_sender_id = u.id\n" +
                    " WHERE f.user_id = ?");
            stat.setLong(1, id);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                requestsList.add(new Users(
                                rs.getLong("id"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("full_name"),
                                rs.getDate("birth_date"),
                                rs.getString("picture_url")
                        )
                );
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        return requestsList;
    }

    public static void addFriend(Long user_id, Long friend_id) {
        try {
            PreparedStatement statement = connection.prepareStatement("insert into friends (id, user_id, friend_id, added_time) " +
                    "values(null,?,?,null) ");
            statement.setLong(1, user_id);
            statement.setLong(2, friend_id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM friends_requests WHERE user_id = ? and request_sender_id=? ");

            statement.setLong(1, friend_id);
            statement.setLong(2, user_id);

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void removeFriend(Long id,Long fr_id){
        try {
            PreparedStatement statement=connection.prepareStatement("delete from friends where user_id=? and friend_id=? or user_id=? and friend_id=? ");
            statement.setLong(1, id);
            statement.setLong(2, fr_id);
            statement.setLong(3, fr_id);
            statement.setLong(4, id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static boolean reject(Long user_id, Long friend_id){
        int rows = 0;
        System.out.println("user id= "+user_id);
        System.out.println("friend id= "+friend_id);
        try {
            PreparedStatement statement = connection.prepareStatement("delete from friends_requests where request_sender_id = ? and user_id = ?");

            statement.setLong(1, user_id);
            statement.setLong(2, friend_id);

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static boolean addFriendReq(Long userId, Long friendRequestId){
        int rows=0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO friends_requests (id, user_id, request_sender_id, sent_time) VALUES (null,?,?, NOW()) ");
            statement.setLong(1,userId);
            statement.setLong(2, friendRequestId);

            rows = statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows>0;
    }
}

