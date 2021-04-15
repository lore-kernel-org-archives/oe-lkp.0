Content-Type: multipart/mixed; boundary="===============6195875878771564090=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Thu, 15 Apr 2021 16:19:52 +0800
Message-ID: <87a6q0ot7b.fsf@yhuang6-desk1.ccr.corp.intel.com>
In-Reply-To: <CAOUHufaAz72+0HJu=XPv-6T8rUAdYo_mb5=H+yF3=LfwoufeYg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6195875878771564090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yu Zhao <yuzhao@google.com> writes:

> On Wed, Apr 14, 2021 at 9:00 PM Andi Kleen <ak@linux.intel.com> wrote:
>>
>> > We fall back to the rmap when it's obviously not smart to do so. There
>> > is still a lot of room for improvement in this function though, i.e.,
>> > it should be per VMA and NUMA aware.
>>
>> Okay so it's more a question to tune the cross over heuristic. That
>> sounds much easier than replacing everything.
>>
>> Of course long term it might be a problem to maintain too many
>> different ways to do things, but I suppose short term it's a reasonable
>> strategy.
>
> Hi Rik, Ying,
>
> Sorry for being persistent. I want to make sure we are on the same page:
>
> Page table scanning doesn't replace the existing rmap walk. It is
> complementary and only happens when it is likely that most of the
> pages on a system under pressure have been referenced, i.e., out of
> *inactive* pages, by definition of the existing implementation. Under
> such a condition, scanning *active* pages one by one with the rmap is
> likely to cost more than scanning them all at once via page tables.
> When we evict *inactive* pages, we still use the rmap and share a
> common path with the existing code.
>
> Page table scanning falls back to the rmap walk if the page tables of
> a process are apparently sparse, i.e., rss < size of the page tables.
>
> I should have clarified this at the very beginning of the discussion.
> But it has become so natural to me and I assumed we'd all see it this
> way.
>
> Your concern regarding the NUMA optimization is still valid, and it's
> a high priority.

Hi, Yu,

In general, I think it's a good idea to combine the page table scanning
and rmap scanning in the page reclaiming.  For example, if the
working-set is transitioned, we can take advantage of the fast page
table scanning to identify the new working-set quickly.  While we can
fallback to the rmap scanning if the page table scanning doesn't help.

Best Regards,
Huang, Ying
--===============6195875878771564090==--

