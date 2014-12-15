Content-Type: multipart/mixed; boundary="===============6854094304258766797=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86_64, vsyscall] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Mon, 15 Dec 2014 09:07:38 +0800
Message-ID: <1418605658.5745.144.camel@linux.intel.com>
In-Reply-To: <CALCETrUYd3obWmBRWooA+J1fpxvsjvLEyReZ=2weMUQHhgykrg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6854094304258766797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2014-12-14 at 17:03 -0800, Andy Lutomirski wrote:
> On Sun, Dec 14, 2014 at 4:58 PM, Huang Ying <ying.huang@linux.intel.com=
> wrote:
> > FYI, we noticed the below changes on
> >
> > commit 1ad83c858c7d4ea210429142c99a1548e6715a35 ("x86_64,vsyscall: Make=
 vsyscall emulation configurable")
> >
> =

> This is expected.  You turned off an expert option, disabling
> emulation of a deprecated feature that your init needs. :)  If you
> enable that option but boot with vsyscall=3Dnone, you'll get the same
> OOPS, but you'll get a helpful error message, too.
> =

> Either force CONFIG_X86_VSYSCALL_EMULATION=3Dy or upgrade to a modern
> gilbc and make sure you rebuild all your static binaries.

Thanks a lot for your information!  That is helpful for our testing!

Best Regards,
Huang, Ying



--===============6854094304258766797==--

