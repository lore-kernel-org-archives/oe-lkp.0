Content-Type: multipart/mixed; boundary="===============0798350646110154248=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] ed3ce2a917: BUG:unable_to_handle_kernel
Date: Thu, 09 Mar 2017 09:17:36 +0100
Message-ID: <20170309081736.7jbbbcjwehjnhjwg@pd.tnic>
In-Reply-To: <20170309023052.grzkmd2m6cttnesv@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0798350646110154248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 10:30:52AM +0800, Fengguang Wu wrote:
> One possible improvement is to provide "lkp qemu" reproduce steps for
> kernel oops -- it would be way more convenient and safe to follow than
> "lkp run", since the later risks hang the physical machine.

Right, that would mean that the bug should be triggerable in qemu. Some
bugs happen on baremetal only though.

> As for the test description, the dmesg carries markers for the user
> space test start/stop points, so the robot can easily tell whether the
> oops happen during the test or before/after the test -- the latter may
> well (but not always) indicate the oops is not relevant to the testcase,
> but to the regular kernel boot/reboot/kexec process.

Right, if that is made part of the report, it would make the reports
better. Something like: "this happens when preparing our test env" or
"this happens while running this test blabla".

Thanks guys and keep up the good work!

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============0798350646110154248==--

