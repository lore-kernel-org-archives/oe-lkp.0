Content-Type: multipart/mixed; boundary="===============0459201190759183182=="
MIME-Version: 1.0
From: Joonsoo Kim <js1304@gmail.com>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Mon, 23 Nov 2015 18:24:29 +0900
Message-ID: <CAAmzW4M6oJukBLwucByK89071RukF4UEyt02A7ZjenpPr5rsdQ@mail.gmail.com>
In-Reply-To: <5652CF40.6040400@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0459201190759183182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2015-11-23 17:33 GMT+09:00 Aaron Lu <aaron.lu@intel.com>:
> On 11/23/2015 04:16 PM, Joonsoo Kim wrote:
>> Numbers looks fine to me. I guess this performance degradation is
>> caused by COMPACT_CLUSTER_MAX change (from 32 to 256). THP allocation
>> is async so should be aborted quickly. But, after isolating 256
>> migratable pages, it can't be aborted and will finish 256 pages
>> migration (at least, current implementation).

Let me correct above comment. It can be aborted after some try.

>> Aaron, please test again with setting COMPACT_CLUSTER_MAX to 32
>> (in swap.h)?
>
> This is what I found in include/linux/swap.h:
>
> #define SWAP_CLUSTER_MAX 32UL
> #define COMPACT_CLUSTER_MAX SWAP_CLUSTER_MAX
>
> Looks like it is already 32, or am I looking at the wrong place?
>
> BTW, I'm using v4.3 for all these tests, and I just checked v4.4-rc2,
> the above definition doesn't change.

Sorry. I looked at linux-next tree and, there, it is 128.
Please ignore my comment! :)

>>
>> And, please attach always-always's vmstat numbers, too.
>
> Sure, attached the vmstat tool output, taken every second.

Oops... I'd like to see '1 sec interval cat /proc/vmstat' for always-never.

Thanks.

--===============0459201190759183182==--

