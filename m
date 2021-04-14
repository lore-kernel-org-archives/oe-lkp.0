Content-Type: multipart/mixed; boundary="===============1547326730041004261=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Tue, 13 Apr 2021 22:13:16 -0600
Message-ID: <CAOUHufafMcaG8sOS=1YMy2P_6p0R1FzP16bCwpUau7g1-PybBQ@mail.gmail.com>
In-Reply-To: <f4750f9431bd12b7338a47925de8b17015da51a7.camel@surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1547326730041004261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 8:30 PM Rik van Riel <riel@surriel.com> wrote:
>
> On Wed, 2021-04-14 at 09:14 +1000, Dave Chinner wrote:
> > On Tue, Apr 13, 2021 at 10:13:24AM -0600, Jens Axboe wrote:
> >
> > > The initial posting of this patchset did no better, in fact it did
> > > a bit
> > > worse. Performance dropped to the same levels and kswapd was using
> > > as
> > > much CPU as before, but on top of that we also got excessive
> > > swapping.
> > > Not at a high rate, but 5-10MB/sec continually.
> > >
> > > I had some back and forths with Yu Zhao and tested a few new
> > > revisions,
> > > and the current series does much better in this regard. Performance
> > > still dips a bit when page cache fills, but not nearly as much, and
> > > kswapd is using less CPU than before.
> >
> > Profiles would be interesting, because it sounds to me like reclaim
> > *might* be batching page cache removal better (e.g. fewer, larger
> > batches) and so spending less time contending on the mapping tree
> > lock...
> >
> > IOWs, I suspect this result might actually be a result of less lock
> > contention due to a change in batch processing characteristics of
> > the new algorithm rather than it being a "better" algorithm...
>
> That seems quite likely to me, given the issues we have
> had with virtual scan reclaim algorithms in the past.

Hi Rik,

Let paste the code so we can move beyond the "batching" hypothesis:

static int __remove_mapping(struct address_space *mapping, struct page
*page,
                            bool reclaimed, struct mem_cgroup *target_memcg)
{
        unsigned long flags;
        int refcount;
        void *shadow =3D NULL;

        BUG_ON(!PageLocked(page));
        BUG_ON(mapping !=3D page_mapping(page));

        xa_lock_irqsave(&mapping->i_pages, flags);

> SeongJae, what is this algorithm supposed to do when faced
> with situations like this:

I'll assume the questions were directed at me, not SeongJae.

> 1) Running on a system with 8 NUMA nodes, and
> memory
>    pressure in one of those nodes.
> 2) Running PostgresQL or Oracle, with hundreds of
>    processes mapping the same (very large) shared
>    memory segment.
>
> How do you keep your algorithm from falling into the worst
> case virtual scanning scenarios that were crippling the
> 2.4 kernel 15+ years ago on systems with just a few GB of
> memory?

There is a fundamental shift: that time we were scanning for cold pages,
and nowadays we are scanning for hot pages.

I'd be surprised if scanning for cold pages didn't fall apart, because it'd
find most of the entries accessed, if they are present at all.

Scanning for hot pages, on the other hand, is way better. Let me just
reiterate:
1) It will not scan page tables from processes that have been sleeping
   since the last scan.
2) It will not scan PTE tables under non-leaf PMD entries that do not
   have the accessed bit set, when
   CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
3) It will not zigzag between the PGD table and the same PMD or PTE
   table spanning multiple VMAs. In other words, it finishes all the
   VMAs with the range of the same PMD or PTE table before it returns
   to the PGD table. This optimizes workloads that have large numbers
   of tiny VMAs, especially when CONFIG_PGTABLE_LEVELS=3D5.

So the cost is roughly proportional to the number of referenced pages it
discovers. If there is no memory pressure, no scanning at all. For a system
under heavy memory pressure, most of the pages are referenced (otherwise
why would it be under memory pressure?), and if we use the rmap, we need to
scan a lot of pages anyway. Why not just scan them all? This way you save a
lot because of batching (now it's time to talk about batching). Besides,
page tables have far better memory locality than the rmap. For the shared
memory example you gave, the rmap needs to lock *each* page it scans. How
many 4KB pages does your large file have? I'll leave the math to you.

Here are some profiles:

zram with the rmap (mainline)
  31.03%  page_vma_mapped_walk
  25.59%  lzo1x_1_do_compress
   4.63%  do_raw_spin_lock
   3.89%  vma_interval_tree_iter_next
   3.33%  vma_interval_tree_subtree_search

zram with page table scanning (this patchset)
  49.36%  lzo1x_1_do_compress
   4.54%  page_vma_mapped_walk
   4.45%  memset_erms
   3.47%  walk_pte_range
   2.88%  zram_bvec_rw

Note that these are not just what I saw from some local benchmarks. We have
observed *millions* of machines in our fleet.

I encourage you to try it and see for yourself. It's as simple as:

git fetch https://linux-mm.googlesource.com/page-reclaim
 refs/changes/73/1173/1

CONFIG_LRU_GEN=3Dy
CONFIG_LRU_GEN_ENABLED=3Dy

and build and run your favorite benchmarks.

--===============1547326730041004261==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+T24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgODozMCBQTSBSaWsgdmFuIFJp
ZWwgJmx0OzxhIGhyZWY9Im1haWx0bzpyaWVsQHN1cnJpZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
cmllbEBzdXJyaWVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4mZ3Q7PGJyPiZndDsgT24gV2VkLCAy
MDIxLTA0LTE0IGF0IDA5OjE0ICsxMDAwLCBEYXZlIENoaW5uZXIgd3JvdGU6PGJyPiZndDsgJmd0
OyBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCAxMDoxMzoyNEFNIC0wNjAwLCBKZW5zIEF4Ym9lIHdy
b3RlOjxicj4mZ3Q7ICZndDs8YnI+Jmd0OyAmZ3Q7ICZndDsgVGhlIGluaXRpYWwgcG9zdGluZyBv
ZiB0aGlzIHBhdGNoc2V0IGRpZCBubyBiZXR0ZXIsIGluIGZhY3QgaXQgZGlkPGJyPiZndDsgJmd0
OyAmZ3Q7IGEgYml0PGJyPiZndDsgJmd0OyAmZ3Q7IHdvcnNlLiBQZXJmb3JtYW5jZSBkcm9wcGVk
IHRvIHRoZSBzYW1lIGxldmVscyBhbmQga3N3YXBkIHdhcyB1c2luZzxicj4mZ3Q7ICZndDsgJmd0
OyBhczxicj4mZ3Q7ICZndDsgJmd0OyBtdWNoIENQVSBhcyBiZWZvcmUsIGJ1dCBvbiB0b3Agb2Yg
dGhhdCB3ZSBhbHNvIGdvdCBleGNlc3NpdmU8YnI+Jmd0OyAmZ3Q7ICZndDsgc3dhcHBpbmcuPGJy
PiZndDsgJmd0OyAmZ3Q7IE5vdCBhdCBhIGhpZ2ggcmF0ZSwgYnV0IDUtMTBNQi9zZWMgY29udGlu
dWFsbHkuPGJyPiZndDsgJmd0OyAmZ3Q7PGJyPiZndDsgJmd0OyAmZ3Q7IEkgaGFkIHNvbWUgYmFj
ayBhbmQgZm9ydGhzIHdpdGggWXUgWmhhbyBhbmQgdGVzdGVkIGEgZmV3IG5ldzxicj4mZ3Q7ICZn
dDsgJmd0OyByZXZpc2lvbnMsPGJyPiZndDsgJmd0OyAmZ3Q7IGFuZCB0aGUgY3VycmVudCBzZXJp
ZXMgZG9lcyBtdWNoIGJldHRlciBpbiB0aGlzIHJlZ2FyZC4gUGVyZm9ybWFuY2U8YnI+Jmd0OyAm
Z3Q7ICZndDsgc3RpbGwgZGlwcyBhIGJpdCB3aGVuIHBhZ2UgY2FjaGUgZmlsbHMsIGJ1dCBub3Qg
bmVhcmx5IGFzIG11Y2gsIGFuZDxicj4mZ3Q7ICZndDsgJmd0OyBrc3dhcGQgaXMgdXNpbmcgbGVz
cyBDUFUgdGhhbiBiZWZvcmUuPGJyPiZndDsgJmd0Ozxicj4mZ3Q7ICZndDsgUHJvZmlsZXMgd291
bGQgYmUgaW50ZXJlc3RpbmcsIGJlY2F1c2UgaXQgc291bmRzIHRvIG1lIGxpa2UgcmVjbGFpbTxi
cj4mZ3Q7ICZndDsgKm1pZ2h0KiBiZSBiYXRjaGluZyBwYWdlIGNhY2hlIHJlbW92YWwgYmV0dGVy
IChlLmcuIGZld2VyLCBsYXJnZXI8YnI+Jmd0OyAmZ3Q7IGJhdGNoZXMpIGFuZCBzbyBzcGVuZGlu
ZyBsZXNzIHRpbWUgY29udGVuZGluZyBvbiB0aGUgbWFwcGluZyB0cmVlPGJyPiZndDsgJmd0OyBs
b2NrLi4uPGJyPiZndDsgJmd0Ozxicj4mZ3Q7ICZndDsgSU9XcywgSSBzdXNwZWN0IHRoaXMgcmVz
dWx0IG1pZ2h0IGFjdHVhbGx5IGJlIGEgcmVzdWx0IG9mIGxlc3MgbG9jazxicj4mZ3Q7ICZndDsg
Y29udGVudGlvbiBkdWUgdG8gYSBjaGFuZ2UgaW4gYmF0Y2ggcHJvY2Vzc2luZyBjaGFyYWN0ZXJp
c3RpY3Mgb2Y8YnI+Jmd0OyAmZ3Q7IHRoZSBuZXcgYWxnb3JpdGhtIHJhdGhlciB0aGFuIGl0IGJl
aW5nIGEgJnF1b3Q7YmV0dGVyJnF1b3Q7IGFsZ29yaXRobS4uLjxicj4mZ3Q7PGJyPiZndDsgVGhh
dCBzZWVtcyBxdWl0ZSBsaWtlbHkgdG8gbWUsIGdpdmVuIHRoZSBpc3N1ZXMgd2UgaGF2ZTxicj4m
Z3Q7IGhhZCB3aXRoIHZpcnR1YWwgc2NhbiByZWNsYWltIGFsZ29yaXRobXMgaW4gdGhlIHBhc3Qu
PGJyPjxicj48ZGl2PkhpIFJpayw8ZGl2Pjxicj5MZXQgcGFzdGUgdGhlIGNvZGUgc28gd2UgY2Fu
IG1vdmUgYmV5b25kIHRoZSAmcXVvdDtiYXRjaGluZyZxdW90OyBoeXBvdGhlc2lzOjxicj48YnI+
c3RhdGljIGludCBfX3JlbW92ZV9tYXBwaW5nKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5n
LCBzdHJ1Y3QgcGFnZSAqcGFnZSw8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgYm9vbCByZWNsYWltZWQsIHN0cnVjdCBtZW1fY2dyb3VwICp0YXJnZXRfbWVtY2cp
PGJyPns8YnI+wqAgwqAgwqAgwqAgdW5zaWduZWQgbG9uZyBmbGFnczs8YnI+wqAgwqAgwqAgwqAg
aW50IHJlZmNvdW50Ozxicj7CoCDCoCDCoCDCoCB2b2lkICpzaGFkb3cgPSBOVUxMOzxicj48YnI+
wqAgwqAgwqAgwqAgQlVHX09OKCFQYWdlTG9ja2VkKHBhZ2UpKTs8YnI+wqAgwqAgwqAgwqAgQlVH
X09OKG1hcHBpbmcgIT0gcGFnZV9tYXBwaW5nKHBhZ2UpKTs8YnI+PGJyPsKgIMKgIMKgIMKgIHhh
X2xvY2tfaXJxc2F2ZSgmYW1wO21hcHBpbmctJmd0O2lfcGFnZXMsIGZsYWdzKTs8YnI+PGJyPiZn
dDsgU2VvbmdKYWUsIHdoYXQgaXMgdGhpcyBhbGdvcml0aG0gc3VwcG9zZWQgdG8gZG8gd2hlbiBm
YWNlZDxicj4mZ3Q7IHdpdGggc2l0dWF0aW9ucyBsaWtlIHRoaXM6PGJyPjxicj5JJiMzOTtsbCBh
c3N1bWUgdGhlIHF1ZXN0aW9ucyB3ZXJlIGRpcmVjdGVkIGF0IG1lLCBub3QgU2VvbmdKYWUuPGJy
Pjxicj4mZ3Q7IDEpIFJ1bm5pbmcgb24gYSBzeXN0ZW0gd2l0aCA4IE5VTUEgbm9kZXMsIGFuZDxi
cj4mZ3Q7IG1lbW9yeTxicj4mZ3Q7IMKgIMKgcHJlc3N1cmUgaW4gb25lIG9mIHRob3NlIG5vZGVz
Ljxicj4mZ3Q7IDIpIFJ1bm5pbmcgUG9zdGdyZXNRTCBvciBPcmFjbGUsIHdpdGggaHVuZHJlZHMg
b2Y8YnI+Jmd0OyDCoCDCoHByb2Nlc3NlcyBtYXBwaW5nIHRoZSBzYW1lICh2ZXJ5IGxhcmdlKSBz
aGFyZWQ8YnI+Jmd0OyDCoCDCoG1lbW9yeSBzZWdtZW50Ljxicj4mZ3Q7PGJyPiZndDsgSG93IGRv
IHlvdSBrZWVwIHlvdXIgYWxnb3JpdGhtIGZyb20gZmFsbGluZyBpbnRvIHRoZSB3b3JzdDxicj4m
Z3Q7IGNhc2UgdmlydHVhbCBzY2FubmluZyBzY2VuYXJpb3MgdGhhdCB3ZXJlIGNyaXBwbGluZyB0
aGU8YnI+Jmd0OyAyLjQga2VybmVsIDE1KyB5ZWFycyBhZ28gb24gc3lzdGVtcyB3aXRoIGp1c3Qg
YSBmZXcgR0Igb2Y8YnI+Jmd0OyBtZW1vcnk/PGJyPjxkaXY+PGJyPlRoZXJlIGlzIGEgZnVuZGFt
ZW50YWwgc2hpZnQ6IHRoYXQgdGltZSB3ZSB3ZXJlIHNjYW5uaW5nIGZvciBjb2xkIHBhZ2VzLCBh
bmQgbm93YWRheXMgd2UgYXJlIHNjYW5uaW5nIGZvciBob3QgcGFnZXMuPGJyPjxicj5JJiMzOTtk
IGJlIHN1cnByaXNlZCBpZiBzY2FubmluZyBmb3IgY29sZCBwYWdlcyBkaWRuJiMzOTt0IGZhbGwg
YXBhcnQsIGJlY2F1c2UgaXQmIzM5O2QgZmluZCBtb3N0IG9mIHRoZSBlbnRyaWVzIGFjY2Vzc2Vk
LCBpZiB0aGV5IGFyZSBwcmVzZW50IGF0IGFsbC48YnI+PGJyPlNjYW5uaW5nIGZvciBob3QgcGFn
ZXMsIG9uIHRoZSBvdGhlciBoYW5kLCBpcyB3YXkgYmV0dGVyLiBMZXQgbWUganVzdCByZWl0ZXJh
dGU6PGJyPjEpIEl0IHdpbGwgbm90IHNjYW4gcGFnZSB0YWJsZXMgZnJvbSBwcm9jZXNzZXMgdGhh
dCBoYXZlIGJlZW4gc2xlZXBpbmc8YnI+wqAgwqBzaW5jZSB0aGUgbGFzdCBzY2FuLjxicj4yKSBJ
dCB3aWxsIG5vdCBzY2FuIFBURSB0YWJsZXMgdW5kZXIgbm9uLWxlYWYgUE1EIGVudHJpZXMgdGhh
dCBkbyBub3Q8YnI+wqAgwqBoYXZlIHRoZSBhY2Nlc3NlZCBiaXQgc2V0LCB3aGVuPGJyPsKgIMKg
Q09ORklHX0hBVkVfQVJDSF9QQVJFTlRfUE1EX1lPVU5HPXkuPGJyPjMpIEl0IHdpbGwgbm90IHpp
Z3phZyBiZXR3ZWVuIHRoZSBQR0QgdGFibGUgYW5kIHRoZSBzYW1lIFBNRCBvciBQVEU8YnI+wqAg
wqB0YWJsZSBzcGFubmluZyBtdWx0aXBsZSBWTUFzLiBJbiBvdGhlciB3b3JkcywgaXQgZmluaXNo
ZXMgYWxsIHRoZTxicj7CoCDCoFZNQXMgd2l0aCB0aGUgcmFuZ2Ugb2YgdGhlIHNhbWUgUE1EIG9y
IFBURSB0YWJsZSBiZWZvcmUgaXQgcmV0dXJuczxicj7CoCDCoHRvIHRoZSBQR0QgdGFibGUuIFRo
aXMgb3B0aW1pemVzIHdvcmtsb2FkcyB0aGF0IGhhdmUgbGFyZ2UgbnVtYmVyczxicj7CoCDCoG9m
IHRpbnkgVk1BcywgZXNwZWNpYWxseSB3aGVuIENPTkZJR19QR1RBQkxFX0xFVkVMUz01Ljxicj48
YnI+U28gdGhlIGNvc3QgaXMgcm91Z2hseSBwcm9wb3J0aW9uYWwgdG8gdGhlIG51bWJlciBvZiBy
ZWZlcmVuY2VkIHBhZ2VzIGl0IGRpc2NvdmVycy4gSWYgdGhlcmUgaXMgbm8gbWVtb3J5IHByZXNz
dXJlLCBubyBzY2FubmluZyBhdCBhbGwuIEZvciBhIHN5c3RlbSB1bmRlciBoZWF2eSBtZW1vcnkg
cHJlc3N1cmUsIG1vc3Qgb2YgdGhlIHBhZ2VzIGFyZSByZWZlcmVuY2VkIChvdGhlcndpc2Ugd2h5
IHdvdWxkIGl0IGJlIHVuZGVyIG1lbW9yeSBwcmVzc3VyZT8pLCBhbmQgaWYgd2UgdXNlIHRoZSBy
bWFwLCB3ZSBuZWVkIHRvIHNjYW4gYSBsb3Qgb2YgcGFnZXMgYW55d2F5LiBXaHkgbm90IGp1c3Qg
c2NhbiB0aGVtIGFsbD8gVGhpcyB3YXkgeW91IHNhdmUgYSBsb3QgYmVjYXVzZSBvZiBiYXRjaGlu
ZyAobm93IGl0JiMzOTtzIHRpbWUgdG8gdGFsayBhYm91dCBiYXRjaGluZykuIEJlc2lkZXMsIHBh
Z2UgdGFibGVzIGhhdmUgZmFyIGJldHRlciBtZW1vcnkgbG9jYWxpdHnCoHRoYW4gdGhlIHJtYXAu
IEZvciB0aGUgc2hhcmVkIG1lbW9yeSBleGFtcGxlIHlvdSBnYXZlLCB0aGUgcm1hcCBuZWVkcyB0
byBsb2NrICplYWNoKiBwYWdlIGl0IHNjYW5zLiBIb3cgbWFueSA0S0IgcGFnZXMgZG9lcyB5b3Vy
IGxhcmdlIGZpbGUgaGF2ZT8gSSYjMzk7bGwgbGVhdmUgdGhlIG1hdGggdG8geW91LjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+SGVyZSBhcmUgc29tZSBwcm9maWxlczo8ZGl2Pjxicj48L2Rpdj48
ZGl2PnpyYW0gd2l0aCB0aGUgcm1hcCAobWFpbmxpbmUpPC9kaXY+PGRpdj7CoCAzMS4wMyXCoCBw
YWdlX3ZtYV9tYXBwZWRfd2Fsazxicj7CoCAyNS41OSXCoCBsem8xeF8xX2RvX2NvbXByZXNzPGJy
PsKgIMKgNC42MyXCoCBkb19yYXdfc3Bpbl9sb2NrPGJyPsKgIMKgMy44OSXCoCB2bWFfaW50ZXJ2
YWxfdHJlZV9pdGVyX25leHQ8YnI+wqAgwqAzLjMzJcKgIHZtYV9pbnRlcnZhbF90cmVlX3N1YnRy
ZWVfc2VhcmNoPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PnpyYW0gd2l0aCBwYWdlIHRh
YmxlIHNjYW5uaW5nICh0aGlzIHBhdGNoc2V0KTwvZGl2PjwvZGl2PjxkaXY+wqAgNDkuMzYlwqAg
bHpvMXhfMV9kb19jb21wcmVzczxicj7CoCDCoDQuNTQlwqAgcGFnZV92bWFfbWFwcGVkX3dhbGs8
YnI+wqAgwqA0LjQ1JcKgIG1lbXNldF9lcm1zPGJyPsKgIMKgMy40NyXCoCB3YWxrX3B0ZV9yYW5n
ZTxicj7CoCDCoDIuODglwqAgenJhbV9idmVjX3J3PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+Tm90ZSB0aGF0IHRoZXNlIGFyZSBub3QganVzdCB3aGF0IEkgc2F3IGZyb20gc29tZSBsb2Nh
bMKgYmVuY2htYXJrcy4gV2UgaGF2ZSBvYnNlcnZlZCAqbWlsbGlvbnMqIG9mIG1hY2hpbmVzIGlu
IG91ciBmbGVldC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgZW5jb3VyYWdlIHlvdSB0byB0
cnnCoGl0IGFuZCBzZWUgZm9yIHlvdXJzZWxmLiBJdCYjMzk7cyBhcyBzaW1wbGUgYXM6PC9kaXY+
PGRpdj48c3BhbiBjbGFzcz0iZ21haWwtaW0iIHN0eWxlPSJjb2xvcjpyZ2IoODAsMCw4MCkiPjxi
cj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iZ21haWwtaW0iIHN0eWxlPSJjb2xvcjpy
Z2IoODAsMCw4MCkiPmdpdCBmZXRjaMKgPGEgaHJlZj0iaHR0cHM6Ly9saW51eC1tbS5nb29nbGVz
b3VyY2UuY29tL3BhZ2UtcmVjbGFpbSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9saW51eC1tbS5nb29nbGVzb3VyY2UuY29tL3BhZ2UtcmVjbGFpbTwvYT7CoHJlZnMv
Y2hhbmdlcy83My8xMTczLzE8YnI+PGJyPjwvc3Bhbj5DT05GSUdfTFJVX0dFTj15PGJyPkNPTkZJ
R19MUlVfR0VOX0VOQUJMRUQ9eTxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmFuZCBidWls
ZCBhbmQgcnVuIHlvdXIgZmF2b3JpdGUgYmVuY2htYXJrcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============1547326730041004261==--

