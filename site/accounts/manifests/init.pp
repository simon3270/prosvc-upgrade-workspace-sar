# User to define/realize users on Puppet-managed systems
#
############################################################
# Admin Accounts
############################################################
class accounts {
  
  @accounts::virtual { 'cade':
    uid             => 721400105,
    gid             => 721400105,
    realname        => 'Cade Jobs',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCiH+PryfAFDeGIQjsJrI/RHS+hQgaPg2x8Ev2AI+dknJNQhPPtoj9GynEr3VViTpkGCxqImLT9l+f/p7fC4yh0QIN/znWnHTMtrlr3Md4tGtVzvoMwCTxMlzP/ayeGxzYmvwl4lFL0cezFFNy+S6gSRv0iYrAXMIraCg3QUTU/cZj01u35Hbl30RkIt1S5JuP0FabUi27oWqNJh9gVLHAFSLWQvrMC7JwSKlnHlwTwSEnPqO3w41siJ3oKfwh/yMteigVjgmchiOMy+QZ7fJ5dsasWW0e9fXT5Z9D1f92vIDE5ROXv/QQkNETbLeQVe78S7rssqxid1waqu5+mtjy9',
    groups          => ["wheel"],
  }
  @accounts::virtual { 'jmalouf':
    uid             => 721400112,
    gid             => 721400112,
    realname        => 'John Reberts',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqPW85141gZjHVQx0hPsKLuHPQwUHcCbRIq5wPdAZ60e7DU6P85jdt414/qYRvhdNq52GwDUMEUsTHCAouCw85MaAjr3tTkCvjpmye7HeX1M8A7BUrSBlKapnyOcXRW3fmhhQJeHFuPV3WkV1ShlpAAUQ3b4l1k6c+2cs2UGZvPdY5xhszki/iUykSYSl3jkIgxhtC5KAJcp22oHutPRt2KFuQOB6SgjcqrA0nwkfh24P3+kkbNAsF9QVkZpxQsBX4xaB3PvnRqPzMfPyYUXn5T9aN5zLOaadqnwo9wTNFXsgbl+IgvmtSQL8ea3G7gEFpK1w84GOPMKyXGFMDTwAv',
    groups          => ["wheel"],
  }
  @accounts::virtual { 'clejeune':
    uid             => 721400111,
    gid             => 721400111,
    realname        => 'Chris Bar',
    pass            => '',
    sshkeytype      => 'ssh-dss',
    sshkey          => 'AAAAB3NzaC1kc3MAAACBAMSpjPDfR8/tLtN/4W70NgtLaaZjN2jhfIrzrMgrcypux5l7rmusnyniGFJLNX8moka+4vhWJPZJcQ16y5g7F3tTo8hnP8dSVrgT9uPafbhr6dPVM5yZWcLlZfbuKTJZnfVSEVahgEx123n8lQA6MJ5kM1cDsEaDh+CYRblTdggRAAAAFQC+HDhtNTXcLP9m7b6vUZP7/t/lqwAAAIAKkakyV3B08GidyD2eSVuQTbWPSkO0lTG8RM56WH21q/YX3YqL/ncDXrnfILkmNsDq9tEVTAxD7m2d2ifW4WhVoJ+bWyPj4id8/qREnlcA1l+uGi8hmecQF5aIow6eSVgiZTWnqaqflh5UOi2rPMHNfgOkYCtbaG1AwpssD8d+xAAAAIA2E8/9mcRuZhzTbvBn0VVLbutbUfH3pUBsciOIy5+82TUtM+4yESnlQtF9TUK1w2TClWKgHBmB0aCTkhTW1z2cl9pIQIoSvSQIb+4o/8a5CQ/WqcJORJiyZllQJ72aT9xSNicbMasQETuDPBaNPUXSqfAUQqzvGOsJX2GKyg5+Nw==',
    groups          => ["wheel"],
  }
  @accounts::virtual { 'travis':
    uid             => 721400088,
    gid             => 721400088,
    realname        => 'Travis Cook',
    pass            => '',
    sshkeytype      => 'ssh-dss',
    sshkey          => 'AAAAB3NzaC1kc3MAAACBANImsHjWcTgYkCudZFulOStOZY+lOCgXpIE1b7nR/st4B9cGtK+pjFRHABV+7utVw5DnTJoldTlDE0bCBDv3ND0/KFlg09HicB5rUFZn7cHs8dlM1ckPkwy+ILsJcLbC8GCV5C2JPjCexhw+qQOH0+e/toyd8EEUVdEvNntvZArnAAAAFQD5VyE3MOjzk1SrrbIhYFX6z0iLDwAAAIEAz6Q1T/o2+v3NXNj40G36DdUjkEs4u1UJLamgoinXcQqPLqqhea9fN3C9ES9JN2ZV86l4L0JKEXz8nhYQqDWUWAyiBNtHkzP3U7E0vPAnXTagxfQrGX0owkONlKtyb63GdlGYJBTBuFqLrohnvhyBlRMOs1QVT3oQH0G9BMjRSAoAAACAGw0zNW0j82KWid9zWNcJ612hBSqpr3kKHjje0CV8SBa1hA5V4OvUZT22WVQ6im80wueyCTYFXGMDZ6o3UgSg+JPfzg6gUNAW944bdXaLj0XyboiDYpX1Qhy+4oa2edu5FIX5r/teLo4HI0zVpVuw9mE0BwcQ2mcDIq82w4L8Wes=',
    groups          => ["wheel"],
  }
  @accounts::virtual { 'alan':
    uid             => 721400007,
    gid             => 721400007,
    realname        => 'Alan Smith',
    pass            => '',
    sshkeytype      => 'ssh-dss',
    sshkey          => 'AAAAB3NzaC1kc3MAAACBALqlZQheDykf5BRbHgi7Z7qQioU1xnd28snT8XJwJJlkw/Gg8PdrIKGNGQgS8PWE653vPVYeRAriLiK3GKW00O6gtv9t0ZDSWsbLYgxL9jltBCcExI9qyPZnH/I3+jHhcXXekm2642clTNh1Jh/Y0vXbszoGcXtbuw35nM/SuD2nAAAAFQCbiV0fqDNRBxADHp7zrqkAYmrgDQAAAIACnGD8Oyl5IZ5m0pu1RHyXFG0YCFJSsp1JPJ1RZzZIgN8iwNn/exSWOxlx+7k3wStQbTqPKU25vdeFf0HU3chWgxriQPd9lH3oRViu7xNacuqjY/6/1lnNACAtbGneTLLQHFEOsQRZmgRxcrO78LhuRcEiSmHNEJFaJuzFYDYREQAAAIAoq+yiCcO411f3lAnUR1BlHzhwfLS05huxmHJlgrpeHbm5rW3V6rBYqRDmKKuUvUKk1Nz7V/i+3Bcg2Y98spOij3rtd0Bd9dn4oNj0CHVF3x3Ug5FhwFZh0E8Ez/WRkZxOP9uFQL5K+d6fppNj7SHWnXH4c6/KrWyCaD7LHw0Ixg==',
    groups          => ["wheel"],
  }
  @accounts::virtual { 'lanzm':
    uid             => 721400160,
    gid             => 721400160,
    realname        => 'Miguel Trump',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDSHkahLbmvbUwZnVymTI8d2jXa16IXBLcr0B0QdI3Aqo+OdGkxGi58HAPq1p7zz6YZdT225I8f7OzYHzuP0MBmdW4f9LObbrjtRutEucjqg03cjPE2Sd36xT6cl7v+m1TykiCUslild9oKI+fxFi4GFMOmvamse3SuRhUg4+71sqp34bviorPpJkpO6/f9+habUPVDKWmCueTe6NiPDnP50xN9O9Mqhj/ROg5L/+zPlneKrXX41xBBogY0HIRHADytBJrgTrQ5IqSw/yLNhfDHLfIVcdorNMcDWyOjHCmn4Newvi+6Cee1x4o43hYMrIdoLDNSWqCtnIMaR3QpRLBT',
    groups          => ["wheel"],
  }
  @accounts::virtual { 'brianb24':
    uid             => 721400164,
    gid             => 721400164,
    realname        => 'Brian Clinton',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAtwMz6RuJHeQ+CXOMtnq+EsIQtTIfeT6CQw8feztRspPa4n6l+rc5Na0R2Gk5+3JNAazQFdAXWFsqIfARYyQWfCtfANzAiInW+C0/luKSeUmIWTjiexzHytqwJWoygfgOExaKoD8Imfj42zJZXaF71/bfPAv6HMkwqSW+g1DCQnOF1zxlkE5c/7DVAQhaDYKMT1M005MeRSWvqKxZ3PokhN+VmZpsKihC6LlWy6932Q0HsJOYRXm6OjUz+mhBLgBYfXM+aZpcuKZhh4GsVM8WpfZgIVcqL9LReMWg2W19Y2sFkJiMQ9OSAoEctVWKl4Evd0TneeIdGDN5zvYnHTuqKQ==',
    groups          => ["wheel"],
  }

############################################################
# DBA Accounts
############################################################
  @accounts::virtual { 'phillipc30':
    uid             => 721400046,
    gid             => 721400046,
    realname        => 'Phil Bush',
    pass            => '',
    sshkeytype      => 'ssh-dss',
    sshkey          => 'AAAAB3NzaC1kc3MAAACBANTJAVyupvm50Y31BjkvmHss6D+Kn4h9ryg91rDqIEuWOxxGBjkRcQNY5weWWyz1u4dYh6UK8VuBY1wDAdLvTrtDE1B0FOiFBZn7DGWkO/3qBDGBy/4Mb+tNhwv8OYA/SbLhQY1TS/stNt74hFE6U34DAwW+LdWjbXv77ML3cNTnAAAAFQDNZulmbfGr2ezHhZAy7prCvHrmVQAAAIA86RmtbBlErdPikyXD6+E9LvXONFAm7eI3eVYiV12yvXqNWyGGVD+KTINDe1yDFaiaaFfDUzeqKwSsLfY2es0zVsCOSHpyUGHpI5T0saiArCTGoFV7boDBDZbvx4Gs4XiouQbJcsb3QtYlkfJwdeLkF+j9OJrrPrImsAUAXC67PwAAAIEAs+1ppk93xGwpqGULWzNm8ozPsJFBl1lCs34ukscwi27fCNH77VfNfVi3LUnkPZNVNwruplwWvPLTdlPieb/r/qyaw8SLxoXbYmnQFdn8G0mp/FWWYtBDuBehjhBjxg92aJq6CQw8986dgN179Kw0eiqNEpHXpfwryJkfVksVkyw=',
    groups          => ["dba"],
  }
  @accounts::virtual { 'rob':
    uid             => 721400033,
    gid             => 721400033,
    realname        => 'Rob Eggs',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDYDdZAS9aAg7k8jUcN/cnFqNsqeTkCFDnIogum7Vy+s1KtWmyHt9+xKpVO0NBsSlKAhhleVZDPRtydHWCpBJl2nhrL4NpcdwteBoTqkg3EGwiRn4OhV2QotgsauRYYjafYoaLGWGoIFFQKgKOtBv1JQRMPijRGUgZZ4EVgrJThgTOdyqhPtt2ZXSBb4+fwSXPSF2+25F6Jg3ZRwaxBjetEvqGIkrqX31fMYle4Qc4GjFccTl20+K9rwytHw+gjQY2R3oC6uxPa1YApaBnGASbLvNcA1ZiJt5zLYDVZtzVB+3M3/dGgGfsmvlOoJ0K44Od6TXIFqec8br4P54br8E6D',
    groups          => ["dba"],
  }
  @accounts::virtual { 'alexm28':
    uid             => 721400070,
    gid             => 721400070,
    realname        => 'Alex Cheeney',
    pass            => '',
    sshkeytype      => '',
    sshkey          => '',
    groups          => ["dba"],
  }
  @accounts::virtual { 'csteab':
    uid             => 721400153,
    gid             => 721400153,
    realname        => 'Curtis Steab',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAABJQAAAQEArNvF6749tMlzDVHTI6SR02HU4Q2TNmc3zefchiV5tGMdWcN50xGDqOQT83b9fe/Ct1DW+Rq99VKdbme0iyG7B2F08PxwpGhOiAhE0jW0ocKOeloLP0XXXhzvyctTkKIh8b3oDQ/cGMz0Na0pwvmXldVBFwoZpvB4Lr05RDtl4d2muzx1WhHNAc2R7iXx4i5RH44SdUWUCWVA5I8FhqS0C3Ugp3ADc+fhy1YAHM4qnHSXCcb8OMdy2swuB8tFC+zu6pjTKPB66lSjuUtMMDusX83nZ4tWRkdiDFy0zuH6C7tz+M5KaERwFupOt8UPrtyyNIku6WyKnbTj9upLjPQR0w==',
    groups          => ["dba"],
  }
  @accounts::virtual { 'daves14':
    uid             => 721400091,
    gid             => 721400091,
    realname        => 'Dave Roberts',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1nQP/wq7GVNuqGVSP9Xk6M4ffm3VHh7j8sDSqSL2gJospu2+2LVmOAH/ryr2CbPEvyOLgSQbuDPwFls95zwFpmtiAzPL+RENoPpbDsi3f7rEyZ+kV+z4Q51hSoSt8NJcw8e8EPfXqVm2ukkmG0bCVby+p7ljN49As9UU6uotnSkpKGRdYJYdfRFFkUWWXkhbdp3zE6+IQvHrSYaqFUEx+w1/9C/wHeuxXQImoKCu659j9l5Vll7Xvx0uifeIOEGpapBg563BUz+9O49zjFdlWwq9LzKChw0+Awih3jFeKG4e8Zd5i6vLQGpQA9XMLUc6HHrEiQyrMxCc4sm47vxI/',
    groups          => ["dba"],
  }
  @accounts::virtual { 'tysons08':
    uid             => 721400075,
    gid             => 721400075,
    realname        => 'Tyson Winters',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC2M2kXwCsj37ZSQtIduzjpuNSCnkg1LAPrDmHQbjYCcC6rC2tpTruf+XdRmSpidP/KUuhJAsTx9KL4AabGAMOVmfBiEIbVWzcCzsjMcZQoMpF2Pl7J7Ss2PXSx3KaLgWiOfoZmu5Vn2RJBJRTZ2f4snTfUHPyeF/KxrRUmrKbPrwpucbTtBzmwqperYjmKmNhJ77OrlMDhlSgzkMZOWW/ulYaPRnE/FrdqhbUumVMexu26xni5PhhSIG1DYifTUZ+Ma2ByAgLEHMEqrZVq4535P0mnIiYzDzK4Lzm1+cKhNaad1EQArMA9uK7/fGvl1CmzRmiPGaLpkXrikbj5zLup',
    groups          => ["dba"],
  }
  @accounts::virtual { 'mikeg02':
    uid             => 721400047,
    gid             => 721400047,
    realname        => 'Mike Brokeback',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCZHM9558ePdK5vtFGbGlGE7LwgfJNZT/LqgRkTZ+KgsNY+Lwwcd83u4TY+zpQSgTNxeO8iGQCIoGKthCA7xUoFsHg8e+HEOR6SNZEoL/BADmZ/xKwqCdpE+ls+yOKYxnFH3VYzxKaJd19doiBOukE3euwSzV0EY73AkY/fUkPkPEmANhgySxzRgSfw7aSKdy9Hrvrp2IhfjSyWm8xXWOyPzCKoas7o++MFPkR1INgoCezNIZUyjrZquwqPxpn6urFgdKdwQ4znsFn7YLfcUtTB12o+N3qHBsg9VBS8NM9fy7zijAH1LAsr8PBlsTar5BG+7VCxr63hldbjYKt5AwfN',
    groups          => ["dba"],
  }
# Temp Account per UNIX-1536
  @accounts::virtual { 'shashi.tewari':
    uid             => 721400400,
    gid             => 721400400,
    realname        => 'Shashi Pain',
    pass            => '$6$vJQE24p8$WApnvUvcJCvXueWrCr16A5o1TlX.cj/f4PN5jm3RUvc9e04jyebQjbkOlp99qBFqXMw6eh0RMRb5kOVkRUj5B0',
    sshkeytype      => '',
    sshkey          => '',
    groups          => ["dba"],
  }
  @accounts::virtual { 'venkat':
    uid             => 721400401,
    gid             => 721400401,
    realname        => 'Venkat Diagram',
    pass            => '$6$8fsecDLt$dATfiT/YVsKj0BUMxnNd8ZYjLmRbcNoQ8PYUkRq1eBwj1gQHLqrs.EYA9PvjNTrJ7GTrbEzoEtCjUABvfdLqu.',
    sshkeytype      => '',
    sshkey          => '',
    groups          => ["dba"],
  }
  @accounts::virtual { 'michael.arbon':
    uid             => 721400402,
    gid             => 721400402,
    realname        => 'Michael GreyPopon',
    pass            => '$6$pLD5j3Vb$zBUITtgmo.3FbuLHX5itIWeYUTP0DxT4tNzUzURDIea5R6oT86zqYe2dWnbcsG7oCAu.tmFHPhk7o2nFwe/1Q0',
    sshkeytype      => '',
    sshkey          => '',
    groups          => ["dba"],
  }

############################################################
# ERP accounts
############################################################
  @accounts::virtual { 'geniel08':
    uid             => 721400162,
    gid             => 721400162,
    realname        => 'Genie Lion',
    pass            => '$1$HCKBtE6E$VSFP//IrDwyXJmtWGpIlM/',
    sshkeytype      => '',
    sshkey          => '',
    groups          => ["erp"],
  }
  @accounts::virtual { 'justinc12':
    uid             => 721400166,
    gid             => 721400166,
    realname        => 'Justin Nutler',
    pass            => '$6$tYh5Dk79$fGgh0VIvjRySxCeRk4YIQjSpqP7hnaYSCX1UJKb6cOiZL2FLzY72qqxgt/pwP.hotGBI2EC5F606KNe7..Kgt0',
    sshkeytype      => '',
    sshkey          => '',
    groups          => ["erp"],
  }
  @accounts::virtual { 'ravik27':
    uid             => 721400121,
    gid             => 721400121,
    realname        => 'Ravi Dothraki',
    pass            => '$6$Ow4gJjTb$S6kxzxtjAMtMZ7W4IzZlwiEMtCqlV3NzFZUmdjcQ1IzxR4XaiRZ7yrONMBOJsYBlCXrcJMjoZIfvV25QKgkrI.',
    sshkeytype      => '',
    sshkey          => '',
    groups          => ["erp"],
  }
  @accounts::virtual { 'krishanub16':
    uid             => 721400122,
    gid             => 721400122,
    realname        => 'Krishanu Stormborn',
    pass            => '$6$NvmGCDdv$ljkGoy/VvCW5mZ8wdazkLEcBbuVjZtzaReY/9B37XyO3kOfLs8MNDtWhoJ32G3IQRNvN8y3btZMBhx4bF4nAQ/',
    sshkeytype      => '',
    sshkey          => '',
    groups          => ["erp"],
  }
############################################################
# Release Team
############################################################

############################################################
# Developer accounts
############################################################
  @accounts::virtual { 'jasonb22':
    uid             => 721400040,
    gid             => 721400040,
    realname        => 'Jason Hanzel',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCfDDEiPJxkwxQjV3RFx+FyzxyL2SLLKPAlPdWmYIyvdHLigawttY2209CJJiFp2i1vBQQDjA5oDRtug2EPYhv7RiMbu3T8SzeAi/6d9bDdm5qqIfd5wzgJtWKp6b0y7bm60B0U3iB6YrJbJCqr2RuK6R0T1/7Kmh7UL2zpSpiSo+mmajrgYnIp2Lqosvua3YJXtnDTMq7yoaL1fqouoc1TJiO6R232XbWiVAaPRio9O3swjZiqCKZuVh0VuwffI5os6tcnRFNsB35Pe69AMh46C7cACGNYE4MvUfh6yxmog1Wg+bTh9T0jx+bGoi86UQRctiAtRFoGrpxHk8eifRVR',
    groups          => ["dev","tomcat"],
  }
  @accounts::virtual { 'chris':
    uid             => 721400074,
    gid             => 721400074,
    realname        => 'Christopher Goleum',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD230XZVWkKER43LmpChPrSNIDJONglbwwJHa+bs4JRJZPi8/CjW3gibTVY81KsgsPOqPTPWk4bUjgl74VxdYB73Zz1Sb8XLlZ4K0EGXL2d9IRLS39aFNyKMRQDorXu8uaFRwO7ia86mbwX1+td2bWxN2Skiu7oXme0r3dnPCJEvdY5rp+zSQ+SRb3sPpzvFKQZm4t+SnbllLkvQxe3snaLGv09ADN0WdKtR4PjljX/F166rZyjOZYA53R7XiMqTtsoLIqiBx7HVzhzigll8HNGN512ABZyE1BjSDwq1y2C0w9DbPCxuoNNlF76FuB7VXdek4yrzWEaKOVRGrga8NwR',
    groups          => ["dev","tomcat"],
  }
  @accounts::virtual { 'jaredb07':
    uid             => 721400200,
    gid             => 721400200,
    realname        => 'Jared Bucket',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC0pcmAHrsv45fTLoiKak6E3pAmFlqo6pB9N7QzC7WN8QbZbgsHzOclk1PE/18yVwXSdNnbq+pZVSd31YUwkoMLnkv9Vflkmq1k4H7oTSn2Oc1zZAc72fNV8Iu+xQOBtlLJV/XsGaAIV/5frtRWdYuRtCjWiTQ7sKUHczc/P26YLi6pw2XCYjHeP6NtDFCCRF+BxHE3s3xmbOO2zod3Lk439Dmk56QDgeQD+ACvEXqjRf0sErUWXGIDcpRSy/dbDa7W3DsUOY4P5/AH/ONgZgYYljB6YSeYBJF9iXFCmnkhHJEJ2CX9OSrigR614KUPZw0jdYmwBK2t1Z+sOb2dBruf',
    groups          => ["dev","tomcat"],
  }
  @accounts::virtual { 'john13':
    uid             => 721400201,
    gid             => 721400201,
    realname        => 'John Walkway',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCkYiQBg4T/RKs9TWDiieCt7RuMhB9nU4c5ZxdWMGqOYt6Brl23TYqoJTFK/ZDeR05YdIflntNEHir6QOZXZjGiQWcMqIxXGAYLRziON5e8Bntz5NY5e4A0bHd5Wpp9ZmNFd1tsmNMN8DFNiJkYk2hhb+N5Axe3dnGL1W1i2RQql0zlAVaweBqax5afofJQ4sNURUtDI2zPo9H/7uKoToRZMgMRY2ZVlVA407oW4apMJwRJRMC57h3dvYjrM+MgWRYr6dpJaSdPdWKr6Rjd/oD+rP/OjpNZF5oK91Nyc9oXAHIEi+nukogytvjP7B13CkAT8aYekyRBhLNgat3bKcUv',
    groups          => ["dev","tomcat"],
  }
  @accounts::virtual { 'nickh20':
    uid             => 721400202,
    gid             => 721400202,
    realname        => 'Nick Candle',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1xst8WR2H9dRhqZlj6+6wU7YCcsPjUQ8tGmyNkdH0E3YFIDQ2UpF3ZGcaGMjoDABaU7HGvHBv7lQfUQ8oftJ7Q7BeoNO+wlaoHAhqPE3lvuW0vjVyM4KkxovwfWCJ0piC2kzgOSIKxS9hDAcpVL7y0J9jpvDz8ZCLuBT19blGXgeYPp1Q863OIBv+IxBcr0Q3HnHLomegddxrg9yF57swogZhKKRtt9OqA/U52L/L36o8Y+AQVwb2NTHKH8UkBNddu8Y2qwrNHYP9QSwpAHr0vlYOVNO0lNFz/aPt0rGRzahh1g4E/KjucSA0ZyWTWQaGSjg7KcGzpQd7Vq5fRm43',
    groups          => ["dev","tomcat"],
  }

############################################################
# Build Team accounts
############################################################
  @accounts::virtual { 'gregs25':
    uid             => 721400081,
    gid             => 721400081,
    realname        => 'Greg Grey',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDLcqbye4yJJSt8TeObsyEHYa8pTZVFp6sC+bu2GrRwc+eqbDL1QCtzbeJ5asmHBN6WgTqvR8WaRenM6IKMMhmbdqz8/FsLDNaa41VJhaVUogX0Gr+J4pRY5yc83TIB1+Wvwz/0hlR4yJOO5XSAMkiNOjezz4WvF6nIFwp2vwczsEumM6L4K3TxeoSKmJLErtVrcJ60D5kuNc+UgxJb4mNxGECH/QodyxCt/WpZ+xny7T8E2MqHTX0xSU22Y1SN3W0Xse8KYf4JawyftnrHzfCebE5oDT1aKL3BqGQEV/pDN6Tn2h1AOzy9A5g/RWd2Lr+mp2gW05lHjmr/M4fCjsfT',
    groups          => ["devops"],
  }
  @accounts::virtual { 'michaelp23':
    uid             => 721400148,
    gid             => 721400148,
    realname        => 'Michael Spiderman',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCxdDQclyL5DziXc9A8m9UlnDuE54TF9W2q5C/oP+hcn3/ro0guF5Fl2oyrkFv9zeo6lx2XvMCFGg+84kLAnWSNjeQyJqJNTF9O4cDwGXH1iEkLoHjTy2hXhhVIQ05DPR3+X9+FGoPecs9kbpnBoY02mZCTLGdNBWABf2odaoVBFKWpWc2wyHSG6OrewYOmrFzAvYs7g2ov5OKMjyIqMew72dk+50kM8VzIEF6HggW6rpGqpQMOk8uuyM3xwCc+3gu/zjrefAze8m2QR0+oOzI8iHPE3ynLaTrRcODE23Cr2Oy6q1HS1bpfsrX8/bnevKXiFaGXUudHKybZLMdjjN7z',
    groups          => ["devops"],
  }
  @accounts::virtual { 'stevet27':
    uid             => 721400149,
    gid             => 721400149,
    realname        => 'Steve Batman',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDGb2d+dRoihxTgT+tO8lHcvzhLMuHbxZlfMteMT417I6/yEM3QlbK9EN+/FjX4XQepI13IsnqnxMS7PIoHiJcnuT3a/ROMyX7lemFihonK7wknfcjmiTAStC3G7Q3HRs2t2s1TkU3HAGIF3cWr7hPBrPz8tFGAdysPe4tRlU+nZw1e/36dFzPNRZ3kxwpJsZ77h6VFQaJwgwZ5I1zcOWIASWaFUAyg8dAye9MGX5FiWwyyEgTE5v8Kylks4FQVXDbnKs8kUMsbu3m4jGdwD9CqQb7fTfnXbku2DmVdwyQO//yqnRp1H/CzTZc2UmItdySHyPBtuP+1VzCUMIs4To25',
    groups          => ["devops"],
  }

############################################################
# System accounts
############################################################
  @accounts::virtual { 'svc-nexpose':
    uid             => 55002,
    gid             => 55002,
    realname        => 'Nexpose User',
    pass            => '',
    sshkeytype      => 'ssh-rsa',
    sshkey          => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDZDOpOt1ru0iKA+lxwqARo1ZSjNvn3DVZoZuwVMRyfC3pnKqQJXMlQlET4mM+GirIYnfg9XsSrg+C14/N9iun4rXJsT18ePARbeK/3lBm5YNWmQyvBULpNdMbId7ounUuEA1YTbAQquP7JAxqgY81Wed1+jUc/mwsH32URnRYtmebLejn53bM3cRQy1FZ9HHbKPBg2izD01DTi5/mMUEQUi2bhWh0qFFkOSt68i0/c7V05ig46JR34/myALUNCYv8BxpnJgBINqFpErmVTAT/YzUD+Y0WmWh0Y2hNYX9+gseAPpP+FvBUYnIpjSW2f0YvmFrWYkVazAGvAGIi0UOMrWcNXj3gb3c3T49NRNMDxxBlb9DkaxUsm1FTxylZXEsdl8dblPJGwLW3mYFcE20FU61x5uyog19jC4UZiwwWjZCSG9zZXNzSRuZWte9+FS8eq+/nRlZ15e+Rvdo7coPsOGwYWvlFfeGl5Mdm4Y/fkJibZ3DL1ZEcSnIrqdCTQvi8UCR2Bo9MkhOrpWyO9xlCK1FM6HlZiY5llScKIHiB/CE01EWHvPtPWWsmjYYE3VlBfxgv4+aX3kirGmhCOnjnYKnBFnEJQnqBYoFzJAc3EkHcrUxXvXmbxYyYy8Z//FE5nDguVzJeBGWcUxHJuMHC3XnvtiDIBR0zJtn28t069uQ==',
    groups          => ["wheel"],
  }
#  @accounts::virtual { 'oracle':
#    uid             => 500,
#    gid             => 54321,
#    realname        => 'Oracle User',
#    pass            => '$6$Yj8i2bt/$Yww75syW1OA9u3uBQcEW4YpsS2K/lOi3ZD1wNVJnXLmuabdOnKRF4agz1DjqSPi7WX9b0h6K6FZo5q3L8izxM0',
#    sshkeytype      => '',
#    sshkey          => '',
#    groups          => ["dba"],
#  }


}
