
class groups::app {

    group { 'app':
        ensure     => present,
        gid        => '3000',
        allowdupe  => true,
    }

}


