Content-Type: multipart/mixed; boundary="===============7671946717693020323=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 07:58:22 +0800
Message-ID: <20160813235822.GA12010@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+55aFwYcjXn7kpLFWQ=jF0sSrhEfZhqNsjR+6O89OOH9qRNOw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7671946717693020323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Aug 12, 2016 at 11:03:33AM -0700, Linus Torvalds wrote:
>On Thu, Aug 11, 2016 at 8:56 PM, Dave Chinner <david@fromorbit.com> wrot=
e:
>> On Thu, Aug 11, 2016 at 07:27:52PM -0700, Linus Torvalds wrote:
>>>
>>> I don't recall having ever seen the mapping tree_lock as a contention
>>> point before, but it's not like I've tried that load either. So it
>>> might be a regression (going back long, I suspect), or just an unusual
>>> load that nobody has traditionally tested much.
>>>
>>> Single-threaded big file write one page at a time, was it?
>>
>> Yup. On a 4 node NUMA system.
>
>Ok, I can't see any real contention on my single-node workstation
>(running ext4 too, so there may be filesystem differences), but I
>guess that shouldn't surprise me. The cacheline bouncing just isn't
>expensive enough when it all stays on-die.
>
>I can see the tree_lock in my profiles (just not very high), and at
>least for ext4 the main caller ssems to be
>__set_page_dirty_nobuffers().
>
>And yes, looking at that, the biggest cost by _far_ inside the
>spinlock seems to be the accounting.
>
>Which doesn't even have to be inside the mapping lock, as far as I can
>tell, and as far as comments go.
>
>So a stupid patch to just move the dirty page accounting to outside
>the spinlock might help a lot.
>
>Does this attached patch help your contention numbers?
>
>Adding a few people who get blamed for account_page_dirtied() and
>inode_attach_wb() just to make sure that nobody expected the
>mapping_lock spinlock to be held when calling account_page_dirtied().
>
>I realize that this has nothing to do with the AIM7 regression (the
>spinlock just isn't high enough in that profile), but your contention
>numbers just aren't right, and updating accounting statistics inside a
>critical spinlock when not needed is just wrong.

I'm testing this patch on top of 9909170065 ("Merge tag 'nfs-for-4.8-2'
of git://git.linux-nfs.org/projects/trondmy/linux-nfs").

The BRD (Ram backed block device, drivers/block/brd.c) tests enables
pretty fast IO. And the fsmark-generic-brd-raid.yaml on lkp-hsx02 will
simulate 8 RAID disks on a 4-node NUMA machine.

queue -q vip -t ivb44 -b wfg/account_page_dirtied-linus aim7-fs-1brd.yaml  =
-R3 -k 1b5f2eb4a752e1fa7102f37545f92e64fabd0cf8 -k 99091700659f4df965e138b3=
8b4fa26a29b7eade

queue -q vip -t ivb43 -b wfg/account_page_dirtied-linus fsmark-stress-journ=
al-1hdd.yaml fsmark-stress-journal-1brd.yaml  -R3 -k 1b5f2eb4a752e1fa7102f3=
7545f92e64fabd0cf8 -k 99091700659f4df965e138b38b4fa26a29b7eade

queue -q vip -t ivb44 -b wfg/account_page_dirtied-linus fsmark-generic-1brd=
.yaml dd-write-1hdd.yaml  fsmark-generic-1hdd.yaml   -R3 -k 1b5f2eb4a752e1f=
a7102f37545f92e64fabd0cf8 -k 99091700659f4df965e138b38b4fa26a29b7eade

queue -q vip -t lkp-hsx02 -b wfg/account_page_dirtied-linus fsmark-generic-=
brd-raid.yaml  -R3 -k 1b5f2eb4a752e1fa7102f37545f92e64fabd0cf8 -k 990917006=
59f4df965e138b38b4fa26a29b7eade

queue -q vip -t lkp-hsw-ep4 -b wfg/account_page_dirtied-linus fsmark-1ssd-n=
vme-small.yaml  -R3 -k 1b5f2eb4a752e1fa7102f37545f92e64fabd0cf8 -k 99091700=
659f4df965e138b38b4fa26a29b7eade

queue -q vip -t lkp-hsw-ep4 -b wfg/account_page_dirtied-linus fsmark-1ssd-n=
vme-small.yaml  -R3 -k 1b5f2eb4a752e1fa7102f37545f92e64fabd0cf8 -k 99091700=
659f4df965e138b38b4fa26a29b7eade

Thanks,
Fengguang

> fs/buffer.c         | 5 ++++-
> fs/xfs/xfs_aops.c   | 5 ++++-
> mm/page-writeback.c | 2 +-
> 3 files changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/fs/buffer.c b/fs/buffer.c
>index 9c8eb9b6db6a..f79a9d241589 100644
>--- a/fs/buffer.c
>+++ b/fs/buffer.c
>@@ -628,15 +628,18 @@ static void __set_page_dirty(struct page *page, stru=
ct address_space *mapping,
> 			     int warn)
> {
> 	unsigned long flags;
>+	bool account =3D false;
>
> 	spin_lock_irqsave(&mapping->tree_lock, flags);
> 	if (page->mapping) {	/* Race with truncate? */
> 		WARN_ON_ONCE(warn && !PageUptodate(page));
>-		account_page_dirtied(page, mapping);
> 		radix_tree_tag_set(&mapping->page_tree,
> 				page_index(page), PAGECACHE_TAG_DIRTY);
>+		account =3D true;
> 	}
> 	spin_unlock_irqrestore(&mapping->tree_lock, flags);
>+	if (account)
>+		account_page_dirtied(page, mapping);
> }
>
> /*
>diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
>index 7575cfc3ad15..59169c36765e 100644
>--- a/fs/xfs/xfs_aops.c
>+++ b/fs/xfs/xfs_aops.c
>@@ -1490,15 +1490,18 @@ xfs_vm_set_page_dirty(
> 	if (newly_dirty) {
> 		/* sigh - __set_page_dirty() is static, so copy it here, too */
> 		unsigned long flags;
>+		bool account =3D false;
>
> 		spin_lock_irqsave(&mapping->tree_lock, flags);
> 		if (page->mapping) {	/* Race with truncate? */
> 			WARN_ON_ONCE(!PageUptodate(page));
>-			account_page_dirtied(page, mapping);
> 			radix_tree_tag_set(&mapping->page_tree,
> 					page_index(page), PAGECACHE_TAG_DIRTY);
>+			account =3D true;
> 		}
> 		spin_unlock_irqrestore(&mapping->tree_lock, flags);
>+		if (account)
>+			account_page_dirtied(page, mapping);
> 	}
> 	unlock_page_memcg(page);
> 	if (newly_dirty)
>diff --git a/mm/page-writeback.c b/mm/page-writeback.c
>index f4cd7d8005c9..9a6a6b99acfe 100644
>--- a/mm/page-writeback.c
>+++ b/mm/page-writeback.c
>@@ -2517,10 +2517,10 @@ int __set_page_dirty_nobuffers(struct page *page)
> 		spin_lock_irqsave(&mapping->tree_lock, flags);
> 		BUG_ON(page_mapping(page) !=3D mapping);
> 		WARN_ON_ONCE(!PagePrivate(page) && !PageUptodate(page));
>-		account_page_dirtied(page, mapping);
> 		radix_tree_tag_set(&mapping->page_tree, page_index(page),
> 				   PAGECACHE_TAG_DIRTY);
> 		spin_unlock_irqrestore(&mapping->tree_lock, flags);
>+		account_page_dirtied(page, mapping);
> 		unlock_page_memcg(page);
>
> 		if (mapping->host) {


--===============7671946717693020323==--

