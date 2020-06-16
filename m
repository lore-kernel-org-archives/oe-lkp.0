Content-Type: multipart/mixed; boundary="===============6385803072588679035=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/entry] 2bbc68f837: ltp.ptrace08.fail
Date: Tue, 16 Jun 2020 10:44:00 +0200
Message-ID: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
In-Reply-To: <20200616075533.GL5653@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6385803072588679035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> writes:
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert Deb=
ug exception to IDTENTRY_DB")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Is the head of linux.git exposing the same problem or is this an
intermittent failure, which only affects bisectability?

Thanks,

        tglx
--===============6385803072588679035==--

