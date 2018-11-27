Content-Type: multipart/mixed; boundary="===============2568728618203177554=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Tue, 27 Nov 2018 20:16:50 +0100
Message-ID: <8b83e5c2-a5f2-18b1-dd66-254945a46bf8@suse.cz>
In-Reply-To: <e4994820-ad41-a510-f579-7b0fc97d8d6f@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2568728618203177554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/27/18 8:05 PM, Vlastimil Babka wrote:
> On 11/27/18 6:08 PM, Linus Torvalds wrote:
>> On Mon, Nov 26, 2018 at 10:24 PM kernel test robot
>> <rong.a.chen@intel.com> wrote:
>>>
>>> FYI, we noticed a -61.3% regression of vm-scalability.throughput due
>>> to commit ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for
>>> MADV_HUGEPAGE mappings")
>>
>> Well, that's certainly noticeable and not good.
>>
>> Andrea, I suspect it might be causing fights with auto numa migration..
>>
>> Lots more system time, but also look at this:
>>
>>>    1122389 =C2=B1  9%     +17.2%    1315380 =C2=B1  4%  proc-vmstat.num=
a_hit
>>>     214722 =C2=B1  5%     +21.6%     261076 =C2=B1  3%  proc-vmstat.num=
a_huge_pte_updates
>>>    1108142 =C2=B1  9%     +17.4%    1300857 =C2=B1  4%  proc-vmstat.num=
a_local
>>>     145368 =C2=B1 48%     +63.1%     237050 =C2=B1 17%  proc-vmstat.num=
a_miss
>>>     159615 =C2=B1 44%     +57.6%     251573 =C2=B1 16%  proc-vmstat.num=
a_other
>>>     185.50 =C2=B1 81%   +8278.6%      15542 =C2=B1 40%  proc-vmstat.num=
a_pages_migrated
>>
>> Should the commit be reverted? Or perhaps at least modified?
> =

> This part of the test's config is important:
> =

> thp_defrag: always
> =

> While the commit targets MADV_HUGEPAGE mappings (such as Andrea's
> kvm-qemu usecase), with defrag=3Dalways, all mappings behave almost as a
> MADV_HUGEPAGE mapping. That's no longer a default for some years now and

Specifically, that's 444eb2a449ef ("mm: thp: set THP defrag by default
to madvise and add a stall-free defrag option") merged in v4.5. So we
might actually hit this regression with 4.4 stable backport...

> I think nobody recommends it. In the default configuration nothing
> changes for non-madvise mappings.
> =

> Vlastimil
> =

>>                      Linus
>>
> =



--===============2568728618203177554==--

