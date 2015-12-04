Content-Type: multipart/mixed; boundary="===============6108972194778054786=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 81ffdcdd97: kmsg.CPU61:Package_temperature_above_threshold, cpu_clock_throttled(total_events=#)
Date: Fri, 04 Dec 2015 11:48:15 +0100
Message-ID: <20151204104815.GA21529@pd.tnic>
In-Reply-To: <87vb8fqaag.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6108972194778054786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2015 at 09:20:39AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 81ffdcdd97d94110627caa81c23d5d780083731d ("x86/mce: Fix thermal th=
rottling reporting after kexec")
> =

> This may be the intended behavior, just FYI.

Should be...

Let me get this straight - before this commit, the messages don't
appear, yes?

Looking at the hunk and AFAICT, it checks APIC_LVTTHMR[VEC] and it did
bail out if something was there !=3D 0 before.

With this check removed, we go and actually init.

So I can imagine BIOS programming stuff in it already and us not even
initializing thermal throttling due to that. And this commit actually
*fixed* it on baremetal too.

But that would be crazy, BIOS would never do something like that?!</sarcasm>

Tony?

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============6108972194778054786==--

