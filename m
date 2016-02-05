Content-Type: multipart/mixed; boundary="===============7472407792598518397=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: Adding Xen to the kbuild bot?
Date: Fri, 05 Feb 2016 12:10:56 -0800
Message-ID: <CALCETrVssJ2oCqT9eKzoXQ0VWz1O1XB=Gt97djrgPYTfZYt_ug@mail.gmail.com>
In-Reply-To: <20160205031116.GB30154@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7472407792598518397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Feb 4, 2016 7:11 PM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:
>
> Hi Andy,
>
> CC more people on Xen testing -- in case OSStest already (or plans to)
> cover such test case.
>
> On Tue, Feb 02, 2016 at 07:31:30PM -0800, Andy Lutomirski wrote:
> > Hi all-
> >
> > Would it make sense to add some basic Xen PV testing to the kbuild bot?
>
> Do you mean to run basic Xen testing on the various kernel trees that
> 0day robot covers? That is, to catch kernel regressions when running
> under Xen.
>

Yes, exactly.  I've personally broken Linux as a Xen guest at least twice.

> If the intention is to catch Xen regressions, the OSStest
> infrastructure may be a better option:
>
>         git://xenbits.xen.org/osstest.git

No, I think that 0day should pick one Xen version and stick with it
for a while rather than trying to track the latest version.

>
> > qemu can boot Xen like this:
> >
> > qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage
> > kernelarg otherkernelarg=3Dvalue" -append 'xenarg other_xen_arg'
> >
> > This should work with any kernel image for x86 or x86_64 with CONFIG_XE=
N=3Dy.
>
> Got it. If you have simple working test scripts to illustrate test
> details, it'd be a great help for integrating into OSStest or 0day.

I have a script that will boot to a command prompt, but I don't know
if that's the right way to do it.  I'm not really sure how 0day works
under the hood, but treating Xen as a different configuration or arch
instead of treating it as a different test case might make more sense.

--Andy

--===============7472407792598518397==--

