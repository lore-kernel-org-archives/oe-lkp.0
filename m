Content-Type: multipart/mixed; boundary="===============1403010478092079599=="
MIME-Version: 1.0
From: Liu Yiding <yidingx.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: IOZone error
Date: Fri, 27 Mar 2020 18:23:37 +0800
Message-ID: <6fe62a94-4bdb-ab7f-c533-a1eb9bd146ae@intel.com>
In-Reply-To: <CANmdEh2ML7_yfck-3GGdc6FcXgJCesshkAxmxFToCG8gxmK+-w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1403010478092079599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 3/27/20 5:58 PM, Deepa B wrote:
> Hello,
> Iozone benchmark is run through LKP on X86 (Linux kernel - 5.3.0,
> Intel(R) Pentium(R) CPU  N3710  @ 1.60GHz) & RISC-V U540(Yocto Linux
> kernel - 5.4.3). Get same error with HDD disks on both.


This job is filterd by lkp-tests/filters/disk, please ensure your host =

has enough hdd disks.


It is possible that lkp can't get your host disks info correctly.

So if your host does have 2 hdd disks, please comment out filters/disk, =

just return 0 as a workaround.

And share us your /dev info, we will fix it asap.


>
> Command:  lkp run ./iozone-2HDD-ext4-kyber.yaml
> rm due to not enough HDD disks
> need: 2, has: 0
> Traceback (most recent call last):
> 6: from /home/test/Ankita/lkp-tests/bin/run-local:131:in
>
> ' 5: from /home/test/Ankita/lkp-tests/lib/job.rb:691:in expand_params'
> 4: from /home/test/Ankita/lkp-tests/lib/job.rb:77:in for_each_in' 3:
> from /home/test/Ankita/lkp-tests/lib/job.rb:77:in each'
> 2: from /home/test/Ankita/lkp-tests/lib/job.rb:78:in block in
> for_each_in' 1: from /home/test/Ankita/lkp-tests/lib/job.rb:694:in
> block in expand_params'
> /home/test/Ankita/lkp-tests/lib/job.rb:669:in `run_filter':
> /home/test/Ankita/lkp-tests/filters/disk: exitstatus 1
> (Job::ParamError)
>
> Could you please help us resolve this?
>
> Thanks,
> Deepa
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Best regards.
Liu Yiding

--===============1403010478092079599==--

