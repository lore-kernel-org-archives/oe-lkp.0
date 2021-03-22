Content-Type: multipart/mixed; boundary="===============7237769759097558494=="
MIME-Version: 1.0
From: Alex Kogan <alex.kogan@oracle.com>
To: lkp@lists.01.org
Subject: Re: [External] : Re: Re: [locking/qspinlock] 0e8d8f4f12: stress-ng.zero.ops_per_sec -9.7% regression
Date: Mon, 22 Mar 2021 19:49:46 -0400
Message-ID: <90FEBB90-F136-4692-8102-9C21367D34B9@oracle.com>
In-Reply-To: <DD47C64E-9687-4CBE-9A07-835E1540DC8D@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7237769759097558494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Mar 22, 2021, at 7:15 PM, Alex Kogan <alex.kogan@oracle.com> wrote:
> =

> Many thanks to Zhengjun Xing for the help in reproducing the issue.
> =

> On our system, the regression is less than 7% (the numbers are below), ho=
wever,
> at least at the full capacity, the numbers are very stable. This allowed =
me to track down the
> issue and identify unnecessary stores into the queue node structure, whic=
h may cause =

> cache misses during lock transfers. Moving those stores into the initiali=
zation code (cna_init_nodes())
> solves the problem.
> =

> Below are the numbers of =E2=80=9Cbogo ops/s=E2=80=9D reported by stress-=
ng with various numbers of workers. =

> Each number represents an average over 25 runs, with the standard deviati=
on reported in ().
> =

> #workers      stock                          CNA / speedup               =
CNA+patch / speedup
>  18  16327.844 (581.744) 15480.061 (582.654) / 0.948  16422.349 (473.729)=
 / 1.006
>  36    8573.557 (285.058)   8003.888 (196.125) / 0.934    8457.436 (258.0=
65) / 0.986
>  72    4042.535 (28.766)     3960.407 (28.648) / 0.980      4107.143 (23.=
037) / 1.016
> 108   2735.913 (7.440)       2678.888 (7.102) / 0.979        2774.751 (4.=
375) / 1.014
> 144   2093.477 (3.341)       2042.968 (1.982) / 0.976        2109.879 (1.=
714) / 1.008

Those are "bogo ops/s (usr+sys time)", btw. Just in case, below are "bogo o=
ps/s (real time)=E2=80=9D
numbers, which I believe is what is reported by the kernel test robot:

#workers      stock                     CNA / speedup               CNA+pat=
ch / speedup
 18   262932.282 (12638.248)   249653.081 (11822.940) / 0.949  265189.104 (=
9271.447) / 1.009
 36   277315.640 (11100.324)   260177.335 (7186.451) / 0.938   274691.250 (=
10329.523) / 0.991
 72   263904.000 (2128.206)    259967.180 (1857.393) / 0.985   268971.483 (=
1713.639) / 1.019
108   273811.373 (664.517)     268949.947 (690.329) / 0.982    278196.867 (=
403.978) / 1.016
144   284321.364 (399.281)     278153.208 (210.776) / 0.978    287343.806 (=
280.963) / 1.011

Regards,
=E2=80=94 Alex

> The patch is attached. As always, comments are welcome!
> =

> Unless there any objections, I will reintegrate the patch into the series=
, and post a new
> revision.
> =

> Regards,
> =E2=80=94 Alex

--===============7237769759097558494==--

