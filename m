Content-Type: multipart/mixed; boundary="===============2437132538919613703=="
MIME-Version: 1.0
From: Trond Myklebust <trond.myklebust@primarydata.com>
To: lkp@lists.01.org
Subject: Re: [NFSv4.1] 6ae373394c4: kernel boot crash
Date: Fri, 06 Feb 2015 22:43:34 -0500
Message-ID: <CAHQdGtSzYoeKN+Tc1-7m7m00Z2cd4iGAB-L65__1UC5uzs7CvQ@mail.gmail.com>
In-Reply-To: <20150207024546.GA27323@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2437132538919613703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2015 at 9:45 PM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
>
> Hi Trond,
>
> We noticed the below kernel crash on
>
> git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
> commit 6ae373394c4257bad562817aa60464ff7fe8f9c4 ("NFSv4.1: Ask for no del=
egation on OPEN if using O_DIRECT")
>
>
> testbox/testcase/testparams: vm-vp-quantal-x86_64/boot/1
>
> 0e3b137fbf0f4ab9  6ae373394c4257bad562817aa6
> ----------------  --------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :100          4%           2:46    dmesg.BUG:kernel_test_crash=
ed
>
> The last dmesg lines before the kernel crash are
>
> [    0.274266] NET: Registered protocol family 1
> [    0.275236] RPC: Registered named UNIX socket transport module.
> [    0.276123] RPC: Registered udp transport module.
> [    0.276860] RPC: Registered tcp transport module.
> [    0.277617] RPC: Registered tcp NFSv4.1 backchannel transport module
>
> Thanks,
> Fengguang


Hi Fengguang,

I'm trying to reproduce this issue, but so far no luck. Do you have
any details on the test itself that you could share with me?

Thanks
   Trond

-- =

Trond Myklebust
Linux NFS client maintainer, PrimaryData
trond.myklebust(a)primarydata.com

--===============2437132538919613703==--

