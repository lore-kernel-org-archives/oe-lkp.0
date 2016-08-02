Content-Type: multipart/mixed; boundary="===============0015056927547218534=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [ 25.666092] WARNING: CPU: 0 PID: 451 at mm/memcontrol.c:998 mem_cgroup_update_lru_size
Date: Tue, 02 Aug 2016 20:48:00 +0800
Message-ID: <20160802124800.GA1475@wfg-t540p.sh.intel.com>
In-Reply-To: <20160802082243.GE2693@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0015056927547218534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mel,

On Tue, Aug 02, 2016 at 09:22:43AM +0100, Mel Gorman wrote:
>On Mon, Aug 01, 2016 at 09:38:30AM +0800, Fengguang Wu wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git mm-vmscan-=
node-lru-follow-up-v2r1
>>
>> commit d5d54a2c5517f0818ad75a2f5b1d26a0dacae46a
>> Author:     Mel Gorman <mgorman@techsingularity.net>
>> AuthorDate: Wed Jul 13 09:30:01 2016 +0100
>> Commit:     Mel Gorman <mgorman@techsingularity.net>
>> CommitDate: Wed Jul 13 09:30:01 2016 +0100
>>
>
>That bug is addressed later in the tree by "mm, vmscan: Update all zone
>LRU sizes before updating memcg". Is the warning visible in the latest
>mainline tree?

Yes that warning no longer show up in branch
"mm-vmscan-node-lru-follow-up-v2r1" HEAD.

Mainline kernel is also fine. I should have checked these,
sorry for the noise!

Regards,
Fengguang

--===============0015056927547218534==--

