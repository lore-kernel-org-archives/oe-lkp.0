Content-Type: multipart/mixed; boundary="===============8269232894822369043=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 09:46:22 +0800
Message-ID: <20170407014622.GO17682@yexl-desktop>
In-Reply-To: <070BEF4AC20468458C22969097656CD94BFB54A4@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8269232894822369043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/06, Li, Aubrey wrote:
>On Thursday, April 06, 2017 2:27 PM, Ye, Xiaolong wrote:
>> On 04/06, Li, Aubrey wrote:
>> >Hi Xiaolong,
>> >
>> >Thanks to report this. Several questions on my side:
>> >(1) how to make a report between <linux-stable tree tag:4.8.8> and
>> ><fast_idle tree HEAD>
>> =

>> You can queue the same job for linux-stable tree tag:4.8.8 and fast_idle=
 tree
>> HEAD, then get the comparison by `compare` tool in inn server.
>> =

>Can you point me a documentation how to do this?
>Or can you please show me the detailed steps?

You may refer to lkp-core/doc/performance-work-guide.md.

For simple use, you may

1) $ lkp queue -b stable/linux-4.8.y -k v4.8.8 -t lkp-bdw-ep2 job.yaml -r 3=
 (attached in the original mail or you can use any other job.yaml customize=
d)
2) $ lkp queue -b fast_idle -k <your head commitid> -t lkp-bdw-ep2 job.yaml=
 -r 3 =

3) wait above jobs done, you can use `lkp wtmp lkp-bdw-ep2` to check the pr=
ogress
4) $ lkp compare -at v4.8.8 <your head commitid> // it will show the compar=
ison

>
>> >
>> >(2) Where can I get the raw data of the report
>> =

>> You can get detailed result root @
>> =

>> inn:/result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performan=
ce/lkp
>> -bdw-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/bb400b924e0
>> 6e94eb12047621bd70d61564fca4c
>
>This is really a confused report. =

>What I want is the report of HEAD of the tree, not a commit id in the midd=
le of my
>patchset.

Actually this is a bisect report, it bisected to the middle patch in your p=
atchset.
For the HEAD test result, it shares the same parent directory with the bise=
cted one,
you can see it in
inn:/result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performance/=
lkp
-bdw-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/<your HEAD comm=
itid>


>
>> >
>> >(3) I need to dig into the test machine bios to confirm if it's
>> >compliant to my expected criteria, how to do that?
>> >
>> =

>> The test machine is lkp-bdw-ep2, you may ssh into it to check?
>> =

>
>ssh is not good enough to me. I need to change the BIOS setting.
>So I need KVM access (screen + keyboard) and root Privilege of that
>machine.

+Lu Lei

Hi, Lei =


Can you help on this?

Thanks,
Xiaolong
>
>Thanks,
>-Aubrey

--===============8269232894822369043==--

