Content-Type: multipart/mixed; boundary="===============4432994622780967653=="
MIME-Version: 1.0
From: J. Bruce Fields <bfields@redhat.com>
To: lkp@lists.01.org
Subject: Re: [fs/locks] fd7732e033: stress-ng.eventfd.ops 21.9% improvement
Date: Tue, 11 Dec 2018 12:05:51 -0500
Message-ID: <20181211170551.GB32360@parsley.fieldses.org>
In-Reply-To: <20181211091429.GO23332@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4432994622780967653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2018 at 05:14:29PM +0800, kernel test robot wrote:
> FYI, we noticed a 21.9% improvement of stress-ng.eventfd.ops due to commi=
t:

So, doesn't sound like a problem, but just looking into it out of
curiosity.....

I love that you do this, but these reports can be hard to figure out
sometimes.  The graphs especially could use better labeling.

> commit: fd7732e033e30b3a586923b57e338c859e17858a ("fs/locks: create a tre=
e of dependent requests.")
> https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git locks-next
> =

> in testcase: stress-ng
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> with following parameters:
> =

> 	nr_threads: 100%
> 	disk: 1HDD
> 	testtime: 1s
> 	class: filesystem
> 	ucode: 0xb00002e
> 	cpufreq_governor: performance

Looking at the man page for stress-ng, it doesn't say much about what it
actually does.  It does say not to use stress-ng as a benchmark.  I
can't tell if it does file locking--the man pages does document some
options which ask for locking (--flock, --locka, --lockf) but I don't
see any evidence in the yaml file or elsewhere that those options are in
use?

These graphs could really use units on the axes.  Also:

>                                  stress-ng.fcntl.ops                     =
       =

>                                                                          =
       =

>   120000 +-+-------------------------------------------------------------=
---+   =

>          O     O    O O O      O   O O O O  O O O O O O  O   O           =
   |   =

>   110000 +-O O    O       O O    O                         O             =
   |   =

>   100000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>    90000 +-+                                                             =
   |   =

>    80000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>    70000 +-+                                                             =
   |   =

>    60000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>    50000 +-+                                                             =
   |   =

>    40000 +-+                                                             =
   |   =

>          |. .+.+..+.+.   .+.+..+.+. .+.+.+..+. .+.   .+.. .+.   .+.      =
.+.|   =

>    30000 +-+-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                              stress-ng.fcntl.ops_per_sec                 =
       =

>                                                                          =
       =

>   120000 +-+-------------------------------------------------------------=
---+   =

>          O     O    O O O      O   O O O O  O O O O O O  O   O           =
   |   =

>   110000 +-O O    O       O O    O                         O             =
   |   =

>   100000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>    90000 +-+                                                             =
   |   =

>    80000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>    70000 +-+                                                             =
   |   =

>    60000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>    50000 +-+                                                             =
   |   =

>    40000 +-+                                                             =
   |   =

>          |. .+.+..+.+.   .+.+..+.+. .+.+.+..+. .+.   .+.. .+.   .+.      =
.+.|   =

>    30000 +-+-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
       =

> [*] bisect-good sample
> [O] bisect-bad  sample

I see O's, not but any *'s.  And what are the +'s?

--b.

--===============4432994622780967653==--

