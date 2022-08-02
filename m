Content-Type: multipart/mixed; boundary="===============3000868922681993028=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 3616799128: BUG_kmalloc-#(Not_tainted):kmalloc_Redzone_overwritten
Date: Tue, 02 Aug 2022 11:43:37 +0200
Message-ID: <85ec4ea8-ae4c-3592-5491-3db6d0ad8c59@suse.cz>
In-Reply-To: <CACT4Y+Zwg8BP=6WJpQ5cCbJxLu4HcnCjx8e53aDEbTZ5uzpUyg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3000868922681993028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/2/22 09:06, Dmitry Vyukov wrote:
> On Tue, 2 Aug 2022 at 08:55, Feng Tang <feng.tang@intel.com> wrote:
>>
>> On Mon, Aug 01, 2022 at 10:23:23PM +0800, Vlastimil Babka wrote:
>> > On 8/1/22 08:21, Feng Tang wrote:
>> [snip]
>> > > Cc kansan  mail list.
>> > >
>> > > This is really related with KASAN debug, that in free path, some
>> > > kmalloc redzone ([orig_size+1, object_size]) area is written by
>> > > kasan to save free meta info.
>> > >
>> > > The callstack is:
>> > >
>> > >   kfree
>> > >     slab_free
>> > >       slab_free_freelist_hook
>> > >           slab_free_hook
>> > >             __kasan_slab_free
>> > >               ____kasan_slab_free
>> > >                 kasan_set_free_info
>> > >                   kasan_set_track
>> > >
>> > > And this issue only happens with "kmalloc-16" slab. Kasan has 2
>> > > tracks: alloc_track and free_track, for x86_64 test platform, most
>> > > of the slabs will reserve space for alloc_track, and reuse the
>> > > 'object' area for free_track.  The kasan free_track is 16 bytes
>> > > large, that it will occupy the whole 'kmalloc-16's object area,
>> > > so when kmalloc-redzone is enabled by this patch, the 'overwritten'
>> > > error is triggered.
>> > >
>> > > But it won't hurt other kmalloc slabs, as kasan's free meta won't
>> > > conflict with kmalloc-redzone which stay in the latter part of
>> > > kmalloc area.
>> > >
>> > > So the solution I can think of is:
>> > > * skip the kmalloc-redzone for kmalloc-16 only, or
>> > > * skip kmalloc-redzone if kasan is enabled, or
>> > > * let kasan reserve the free meta (16 bytes) outside of object
>> > >   just like for alloc meta
>> >
>> > Maybe we could add some hack that if both kasan and SLAB_STORE_USER is
>> > enabled, we bump the stored orig_size from <16 to 16? Similar to what
>> > __ksize() does.
>>
>> How about the following patch:
>>
>> ---
>> diff --git a/mm/slub.c b/mm/slub.c
>> index added2653bb0..33bbac2afaef 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -830,6 +830,16 @@ static inline void set_orig_size(struct kmem_cache =
*s,
>>         if (!slub_debug_orig_size(s))
>>                 return;
>>
>> +#ifdef CONFIG_KASAN
>> +       /*
>> +        * When kasan is enabled, it could save its free meta data in the
>> +        * start part of object area, so skip the kmalloc redzone check
>> +        * for small kmalloc slabs to avoid the data conflict.
>> +        */
>> +       if (s->object_size <=3D 32)
>> +               orig_size =3D s->object_size;
>> +#endif
>> +
>>         p +=3D get_info_end(s);
>>         p +=3D sizeof(struct track) * 2;
>>
>> I extend the size to 32 for potential's kasan meta data size increase.
>> This is tested locally, if people are OK with it, I can ask for 0Day's
>> help to verify this.

Is there maybe some KASAN macro we can use instead of hardcoding 32?

> =

> Where is set_orig_size() function defined? Don't see it upstream nor
> in linux-next.
> This looks fine but my only concern is that this should not increase
> memory consumption when slub debug tracking is not enabled, which
> should be the main operation mode when KASAN is enabled. But I can't
> figure this out w/o context.

It won't increase memory consumption even if slub_debug tracking is enabled.
It just fakes a bit the size that was passed to kmalloc() and which we newly
store (thanks to Feng's patches) for statistics and debugging purposes.

>> Thanks,
>> Feng
>>
>> >
>> > > I don't have way to test kasan's SW/HW tag configuration, which
>> > > is only enabled on arm64 now. And I don't know if there will
>> > > also be some conflict.
>> > >
>> > > Thanks,
>> > > Feng
>> > >
>> >
>>
>> --
>> You received this message because you are subscribed to the Google Group=
s "kasan-dev" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n email to kasan-dev+unsubscribe(a)googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msg=
id/kasan-dev/YujKCxu2lJJFm73P%40feng-skl.

--===============3000868922681993028==--

