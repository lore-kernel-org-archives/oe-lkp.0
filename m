Content-Type: multipart/mixed; boundary="===============3431219465811015526=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/entry] 2bbc68f837: ltp.ptrace08.fail
Date: Tue, 16 Jun 2020 20:24:52 +0800
Message-ID: <20200616122451.GQ5653@shao2-debian>
In-Reply-To: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3431219465811015526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 10:44:00AM +0200, Thomas Gleixner wrote:
> kernel test robot <rong.a.chen@intel.com> writes:
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert D=
ebug exception to IDTENTRY_DB")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> Is the head of linux.git exposing the same problem or is this an
> intermittent failure, which only affects bisectability?
> =


Hi Thomas,

The problem still exists in v5.8-rc1:

9f58fdde95c9509a  2bbc68f8373c0631ebf137f376                    v5.8-rc1  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |    =

           :12          92%          11:12         100%          13:13    l=
tp/1HDD-xfs-syscalls_part4/vm-snb
           :12          92%          11:12         100%          13:13    T=
OTAL ltp.ptrace08.fail

Best Regards,
Rong Chen
--===============3431219465811015526==--

