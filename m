Content-Type: multipart/mixed; boundary="===============8107283663202327947=="
MIME-Version: 1.0
From: J. Bruce Fields <bfields@redhat.com>
To: lkp@lists.01.org
Subject: Re: [fs/locks] 83b381078b: will-it-scale.per_thread_ops -62.5% regression
Date: Tue, 27 Nov 2018 12:43:16 -0500
Message-ID: <20181127174315.GA29963@parsley.fieldses.org>
In-Reply-To: <20181127060102.GF6163@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8107283663202327947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the report!

On Tue, Nov 27, 2018 at 02:01:02PM +0800, kernel test robot wrote:
> FYI, we noticed a -62.5% regression of will-it-scale.per_thread_ops due t=
o commit:
> =

> =

> commit: 83b381078b5ecab098ebf6bc9548bb32af1dbf31 ("fs/locks: always delet=
e_block after waiting.")
> https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git locks-next
> =

> in testcase: will-it-scale
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> with following parameters:
> =

> 	nr_task: 16
> 	mode: thread
> 	test: lock1

So I guess it's doing this, uncontended file lock/unlock?:

	https://github.com/antonblanchard/will-it-scale/blob/master/tests/lock1.c

Each thread is repeatedly locking and unlocking a file that is only used
by that thread.

By the way, what's the X-axis on these graphs?  (Or the y-axis, for that
matter?)

--b.

>                             will-it-scale.per_thread_ops                 =
       =

>                                                                          =
       =

>   450000 +-+-------------------------------------------------------------=
---+   =

>          |                                                               =
   |   =

>   400000 +-+   +..+..  .+..+..  .+..+..+...+..+..+..   +..        .+..   =
 ..|   =

>   350000 +-+ ..      +.       +.                     ..         +.    +..=
+  |   =

>          |  +                                       +     +     :        =
   |   =

>   300000 +-+                                              :    :         =
   |   =

>   250000 +-+                                               :   :         =
   |   =

>          |                                                 :   :         =
   |   =

>   200000 +-+                                               :   :         =
   |   =

>   150000 +-+                                                : :          =
   |   =

>          O  O  O  O  O  O  O  O  O  O  O   O  O  O  O  O  O :O: O  O  O  =
O  O   =

>   100000 +-+                                                : :          =
   |   =

>    50000 +-+                                                : :          =
   |   =

>          |                                                   :           =
   |   =

>        0 +-+-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                will-it-scale.workload                    =
       =

>                                                                          =
       =

>   7e+06 +-+--------------------------------------------------------------=
---+   =

>         |              +...+..           .+..+..+     +            +..   =
   |   =

>   6e+06 +-+   +..+.. ..         .+..+..+.        +   + +         ..      =
 ..|   =

>         |   ..      +         +.                  + +   +       +     +..=
+  |   =

>   5e+06 +-++                                       +     +      :        =
   |   =

>         |                                                :     :         =
   |   =

>   4e+06 +-+                                               :    :         =
   |   =

>         |                                                 :    :         =
   |   =

>   3e+06 +-+                                                :   :         =
   |   =

>         |                                       O     O    :  : O  O     =
   |   =

>   2e+06 O-+O  O  O  O  O   O  O  O  O  O  O  O     O     O : O:       O  =
O  O   =

>         |                                                   : :          =
   |   =

>   1e+06 +-+                                                 : :          =
   |   =

>         |                                                    :           =
   |   =

>       0 +-+--------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                            will-it-scale.time.user_time                  =
       =

>                                                                          =
       =

>   250 +-+----------------------------------------------------------------=
---+   =

>       |                 .+..               .+..                   +..    =
   |   =

>       |..   +...+..  .+.      .+...+..+..+.    +..    +..       ..   .   =
 ..|   =

>   200 +-+ ..       +.       +.                    . ..         +      +..=
+  |   =

>       |  +                                         +     +     :         =
   |   =

>       |                                                  :    :          =
   |   =

>   150 +-+                                                 :   :          =
   |   =

>       |                                                   :   :          =
   |   =

>   100 +-+                                                 :   :          =
   |   =

>       |  O      O                                          : :           =
   |   =

>       O     O      O  O  O  O  O   O  O  O  O  O   O  O  O :O: O  O   O  =
O  O   =

>    50 +-+                                                  : :           =
   |   =

>       |                                                    : :           =
   |   =

>       |                                                     :            =
   |   =

>     0 +-+----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                           will-it-scale.time.system_time                 =
       =

>                                                                          =
       =

>   5000 +-+---------------------------------------------------------------=
---+   =

>   4500 O-+O..O..O...O..O..O..O..O..O..O...O..O..O..O..O..O  O  O...O..O..=
O..O   =

>        |                                                 :     :         =
   |   =

>   4000 +-+                                               :     :         =
   |   =

>   3500 +-+                                                :   :          =
   |   =

>        |                                                  :   :          =
   |   =

>   3000 +-+                                                :   :          =
   |   =

>   2500 +-+                                                :   :          =
   |   =

>   2000 +-+                                                 : :           =
   |   =

>        |                                                   : :           =
   |   =

>   1500 +-+                                                 : :           =
   |   =

>   1000 +-+                                                 : :           =
   |   =

>        |                                                    :            =
   |   =

>    500 +-+                                                  :            =
   |   =

>      0 +-+---------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
       =

> [*] bisect-good sample
> [O] bisect-bad  sample

--===============8107283663202327947==--

