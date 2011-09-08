dataSource {
    pooled = true
    //driverClassName = "org.hsqldb.jdbcDriver"
      driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            pooled = true
            dbCreate = "create-drop"
            driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://localhost/Impulso"
            username = "root"
            password = ""
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            dialect = org.hibernate.dialect.MySQLInnoDBDialect
               driverClassName = "com.mysql.jdbc.Driver"
              username = "root"
               password = "n/a"
             url = "jdbc:mysql://localhost/impulso?useUnicode=true&characterEncoding=utf8"
               dbCreate = "create-drop"      
                      }
    }
}
