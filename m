Content-Type: multipart/mixed; boundary="===============3781652174904410499=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [rbtree_test_init] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper:1]
Date: Wed, 22 Nov 2017 10:15:29 +0800
Message-ID: <20171122021529.drrox2q4acjhlkri@wfg-t540p.sh.intel.com>
In-Reply-To: <20171121135913.63e82d584e269e761573d6bf@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3781652174904410499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 01:59:13PM -0800, Andrew Morton wrote:
>On Tue, 21 Nov 2017 19:10:22 +0800 Fengguang Wu <fengguang.wu@intel.com>=
 wrote:
>
>> Hello,
>>
>> FYI this happens in mainline kernel 4.14.0-03453-ge37e0ee.
>> It at least dates back to v4.1 .
>>
>> It occurs in 2 out of 2 boots.
>>
>> [  140.043368] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swappe=
r:1]
>> ...
>> [  140.044140] Call Trace:
>> [  140.044140]  __asan_loadN+0x19/0x21
>> [  140.044140]  ftrace_likely_update+0x32/0xc3:
>> ftrace_likely_update at kernel/trace/trace_branch.c:209
>> [  140.044140]  ? augment_recompute+0x14b/0x14b:
>> augment_callbacks_rotate at lib/rbtree_test.c:97
>> [  140.044140]  __rb_insert_augmented+0x8d/0x639:
>> __rb_insert at lib/rbtree.c:110
>>   (inlined by) __rb_insert_augmented at lib/rbtree.c:495
>> [  140.044140]  rbtree_test_init+0xbfb/0x1407:
>> rb_insert_augmented_cached at include/linux/rbtree_augmented.h:70
>>   (inlined by) insert_augmented_cached at lib/rbtree_test.c:148
>>   (inlined by) rbtree_test_init at lib/rbtree_test.c:371
>> [  140.044140]  ? glob_init+0x23f/0x23f:
>> rbtree_test_init at lib/rbtree_test.c:245
>
>Does that kernel include 0b548e33e6cb2bf ("lib/rbtree-test: lower
>default params")?  If so, perhaps some cond_resched() sprinkling is
>needed?

Ah I just tested 0b548e33e6cb2bf and it's fine there. 0b548e33e6cb2bf
is merged after e37e0ee0190 in this report, so it indicates a fixed
error. Sorry for the noise!

Regards,
Fengguang

--===============3781652174904410499==--

