Content-Type: multipart/mixed; boundary="===============9208187489152290684=="
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
To: lkp@lists.01.org
Subject: Re: [i915] b12d691ea5: kernel_BUG_at_mm/memory.c
Date: Wed, 19 May 2021 18:00:14 +0300
Message-ID: <87y2ca6a69.fsf@tynnyri.adurom.net>
In-Reply-To: <20210519133330.GA14452@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============9208187489152290684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Christoph Hellwig <hch@lst.de> writes:

> On Tue, May 18, 2021 at 04:58:31PM -1000, Linus Torvalds wrote:
>> On Tue, May 18, 2021 at 4:26 PM kernel test robot <oliver.sang@intel.c=
om> wrote:
>> >
>> > commit: b12d691ea5e01db42ccf3b4207e57cb3ce7cfe91 ("i915: fix remap_io_=
sg to verify the pgprot")
>> > [...]
>> > [  778.550996] kernel BUG at mm/memory.c:2183!
>> > [ 778.559015] RIP: 0010:remap_pfn_range_notrack
>> > (kbuild/src/consumer/mm/memory.c:2183
>> > kbuild/src/consumer/mm/memory.c:2211
>> > kbuild/src/consumer/mm/memory.c:2233
>> > kbuild/src/consumer/mm/memory.c:2255
>> > kbuild/src/consumer/mm/memory.c:2311)
>> > [  778.688951] remap_pfn_range (kbuild/src/consumer/mm/memory.c:2342)
>> > [  778.692700] remap_io_sg (kbuild/src/consumer/drivers/gpu/drm/i915/i=
915_mm.c:71) i915
>> =

>> Yeah, so that BUG_ON() checks that theer isn't any old mapping there.
>> =

>> You can't just remap over an old one, but it does seem like that is
>> exactly what commit b12d691ea5e0 ("i915: fix remap_io_sg to verify the
>> pgprot") ends up doing.
>> =

>> So the code used to just do "apply_to_page_range()", which admittedly
>> was odd too. But it didn't mind having old mappings and re-applying
>> something over them.
>> =

>> Converting it to use remap_pfn_range() does look better, but it kind
>> of depends on it ever being done *once*. But the caller seems to very
>> much remap the whole vmsa at fault time, so...
>> =

>> I don't know what the right thing to do here is, because I don't know
>> the invalidation logic and when faults happen.
>> =

>> I see that there is another thread about different issues on the
>> intel-gfx list. Adding a few people to this kernel test robot thread
>> too.
>> =

>> I'd be inclined to revert the commits as "not ready yet", but it would
>> be better if somebody can go "yeah, this should be done properly like
>> X".
>
> I think reverting just this commit for now is the best thing.

Yes, please revert it if there's no quick fix. On my Dell XPS 13 9310
laptop (with Debian 10) X won't start until I revert commit
b12d691ea5e0, so this is a major issue.

Also adding the new regressions list, as this is an i915 regression
introduced in v5.13-rc1.

-- =

https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
--===============9208187489152290684==--

