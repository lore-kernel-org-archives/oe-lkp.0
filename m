Content-Type: multipart/mixed; boundary="===============7359223323267606478=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm/ASLR] f47233c2d34: WARNING: CPU: 0 PID: 1 at arch/x86/mm/ioremap.c:63 __ioremap_check_ram+0x445/0x4a0()
Date: Thu, 26 Feb 2015 12:12:50 +0100
Message-ID: <20150226111250.GA32024@gmail.com>
In-Reply-To: <20150226103040.GA3573@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============7359223323267606478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Borislav Petkov <bp@suse.de> wrote:

> thanks for the report.
> =

> So, AFAICT, this is caused by ksysfs ioremapping struct =

> setup_data for a short time so that it can count it and =

> show it in /sys/kernel/boot_params/setup_data/*
> =

> And, of course, the setup_data thing which we're using =

> for kaslr param passing is RAM and ioremap complains.
> =

> And currently I don't have a good idea how to fix it. =

> Perhaps introduce an ioremap_* something which suppresses =

> the warning as we're going to iounmap() right afterwards =

> but that's ugly.

Why is it ioremap()-ed to begin with, why cannot the kernel =

access its own data structure in RAM directly?

Thanks,

	Ingo

--===============7359223323267606478==--

