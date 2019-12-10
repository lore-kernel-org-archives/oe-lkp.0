Content-Type: multipart/mixed; boundary="===============2011850914583942418=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [pipe] 3c0edea9b2: lmbench3.PIPE.bandwidth.MB/sec -17.0% regression
Date: Tue, 10 Dec 2019 22:15:02 +0800
Message-ID: <20191210141502.GQ32275@shao2-debian>
In-Reply-To: <CAHk-=whF0mbvWC=sYKWTrpymmjWkGZcX9hnHgnm1t1M++W66zA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2011850914583942418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 10:35:35AM -0800, Linus Torvalds wrote:
> On Mon, Dec 9, 2019 at 12:56 AM Michal Hocko <mhocko@kernel.org> wrote:
> >
> > Huh. How can something like that can even can get merged? No changelog,
> > no s-o-b?
> =

> Yeah, I missed that when pulling.
> =

> I wish that had been the only problem we had with that code, but it wasn'=
t.
> =

> Anyway, I'm fairly certain the current git head should fix this
> lmbench3 performance regression too.
> =

>                    Linus

Hi Linus,

Sorry for the inconvenience, indeed, the regression has been fixed.

commit:
  cefa80ced5 ("pipe: Increase the writer-wakeup threshold to reduce context=
-switch count")
  3c0edea9b2 ("pipe: Remove sync on wake_ups")
  6794862a16 ("Merge tag 'for-5.5-rc1-kconfig-tag' of git://git.kernel.org/=
pub/scm/linux/kernel/git/kdave/linux")

cefa80ced57a2917  3c0edea9b29f9be6c093f236f7  6794862a16ef41f753abd75c03  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
         %stddev      change         %stddev      change         %stddev
             \          |                \          |                \  =

     21204             -17%      17604              23%      26123 =C2=B1  =
3%  lmbench3/performance-development-100%-PIPE-50%-ucode=3D0x7000019/lkp-bd=
w-de1
     21204             -17%      17604              23%      26123        G=
EO-MEAN lmbench3.PIPE.bandwidth.MB/sec

Best Regards,
Rong Chen
--===============2011850914583942418==--

