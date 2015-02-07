Content-Type: multipart/mixed; boundary="===============1535155261510211137=="
MIME-Version: 1.0
From: Trond Myklebust <trond.myklebust@primarydata.com>
To: lkp@lists.01.org
Subject: Re: [NFSv4.1] 6ae373394c4: kernel boot crash
Date: Fri, 06 Feb 2015 23:33:47 -0500
Message-ID: <CAHQdGtRVbYPMV0-XQV+cnBFMRf99gvhnAESB46GnbJfN8djj+Q@mail.gmail.com>
In-Reply-To: <20150207043141.GA4394@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1535155261510211137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2015 at 11:31 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Hi Trond,
>
> On Fri, Feb 06, 2015 at 10:43:34PM -0500, Trond Myklebust wrote:
>> On Fri, Feb 6, 2015 at 9:45 PM, Fengguang Wu <fengguang.wu@intel.com> =
wrote:
>> >
>> > Hi Trond,
>> >
>> > We noticed the below kernel crash on
>> >
>> > git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
>> > commit 6ae373394c4257bad562817aa60464ff7fe8f9c4 ("NFSv4.1: Ask for no =
delegation on OPEN if using O_DIRECT")
>> >
>> >
>> > testbox/testcase/testparams: vm-vp-quantal-x86_64/boot/1
>> >
>> > 0e3b137fbf0f4ab9  6ae373394c4257bad562817aa6
>> > ----------------  --------------------------
>> >        fail:runs  %reproduction    fail:runs
>> >            |             |             |
>> >            :100          4%           2:46    dmesg.BUG:kernel_test_cr=
ashed
>> >
>> > The last dmesg lines before the kernel crash are
>> >
>> > [    0.274266] NET: Registered protocol family 1
>> > [    0.275236] RPC: Registered named UNIX socket transport module.
>> > [    0.276123] RPC: Registered udp transport module.
>> > [    0.276860] RPC: Registered tcp transport module.
>> > [    0.277617] RPC: Registered tcp NFSv4.1 backchannel transport module
>> >
>> > Thanks,
>> > Fengguang
>>
>>
>> Hi Fengguang,
>>
>> I'm trying to reproduce this issue, but so far no luck. Do you have
>> any details on the test itself that you could share with me?
>
> It looks like a false report, sorry!  The real crash dmesg is much
> longer and it ends here:
>
> [   14.605487] i6300esb: Unexpected close, not stopping watchdog!
>
> Which is not relevant to the NFS change at all.
>
> The dmesg I looked at happen to be truncated (perhaps by email server)
> exactly at a NFS line, which treats me to believe it's a good bisect.
>
> Cheers,
> Fengguang

Phew. So I'm off the hook then. :-)

-- =

Trond Myklebust
Linux NFS client maintainer, PrimaryData
trond.myklebust(a)primarydata.com

--===============1535155261510211137==--

