Content-Type: multipart/mixed; boundary="===============8197781742835414250=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [NFSv4.1] 6ae373394c4: kernel boot crash
Date: Fri, 06 Feb 2015 20:31:41 -0800
Message-ID: <20150207043141.GA4394@wfg-t540p.sh.intel.com>
In-Reply-To: <CAHQdGtSzYoeKN+Tc1-7m7m00Z2cd4iGAB-L65__1UC5uzs7CvQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8197781742835414250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On Fri, Feb 06, 2015 at 10:43:34PM -0500, Trond Myklebust wrote:
> On Fri, Feb 6, 2015 at 9:45 PM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
> >
> > Hi Trond,
> >
> > We noticed the below kernel crash on
> >
> > git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
> > commit 6ae373394c4257bad562817aa60464ff7fe8f9c4 ("NFSv4.1: Ask for no d=
elegation on OPEN if using O_DIRECT")
> >
> >
> > testbox/testcase/testparams: vm-vp-quantal-x86_64/boot/1
> >
> > 0e3b137fbf0f4ab9  6ae373394c4257bad562817aa6
> > ----------------  --------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :100          4%           2:46    dmesg.BUG:kernel_test_cra=
shed
> >
> > The last dmesg lines before the kernel crash are
> >
> > [    0.274266] NET: Registered protocol family 1
> > [    0.275236] RPC: Registered named UNIX socket transport module.
> > [    0.276123] RPC: Registered udp transport module.
> > [    0.276860] RPC: Registered tcp transport module.
> > [    0.277617] RPC: Registered tcp NFSv4.1 backchannel transport module
> >
> > Thanks,
> > Fengguang
> =

> =

> Hi Fengguang,
> =

> I'm trying to reproduce this issue, but so far no luck. Do you have
> any details on the test itself that you could share with me?

It looks like a false report, sorry!  The real crash dmesg is much
longer and it ends here:

[   14.605487] i6300esb: Unexpected close, not stopping watchdog!

Which is not relevant to the NFS change at all.

The dmesg I looked at happen to be truncated (perhaps by email server)
exactly at a NFS line, which treats me to believe it's a good bisect.

Cheers,
Fengguang

--===============8197781742835414250==--

