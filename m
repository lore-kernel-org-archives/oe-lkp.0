Content-Type: multipart/mixed; boundary="===============0255058790777919252=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 7bb39313cd: netperf.Throughput_tps -4.5% regression
Date: Tue, 19 Jan 2021 16:33:50 +0100
Message-ID: <20210119153350.GM27433@zn.tnic>
In-Reply-To: <20210119150903.GA21908@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0255058790777919252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 11:09:03PM +0800, Feng Tang wrote:
> Yes, that can happen. I started a 4 tasks netperf on a 4C/8T KBL desktop,
> and also saw around 2% improvement. Both the kernel config and the
> platform matters.

Oh great. ;-\

> For the performance changes I have checked, sometimes the change can be
> reproduced on platforms of different generations (the exact delta number
> may differs), sometimes it can only be reproduced on one specific platfor=
m,
> like some old generation, or special one like Xeon Phi.

Probably because that Xeon Phi thing is not as powerful cache-wise as
some newer ones which have bigger caches and smarter hw prefetchers,
etc.

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============0255058790777919252==--

