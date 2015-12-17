Content-Type: multipart/mixed; boundary="===============8128967928129657533=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: rhashtable: Prevent spurious EBUSY errors on insertion
Date: Thu, 17 Dec 2015 12:00:24 -0500
Message-ID: <20151217.120024.1598833629356298916.davem@davemloft.net>
In-Reply-To: <CADvbK_df=Z1re2wPUF9JCXggBzRqF=Tgt86PXV0KqBcx3VeVNA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8128967928129657533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 17 Dec 2015 17:00:35 +0800

> On Thu, Dec 17, 2015 at 4:48 PM, Herbert Xu <herbert@gondor.apana.org.a=
u> wrote:
>> On Thu, Dec 17, 2015 at 04:46:00PM +0800, Xin Long wrote:
>>>
>>> sorry for late test, but unfortunately, my case with rhashtalbe still
>>> return EBUSY.
>>> I added some debug code in rhashtable_insert_rehash(), and found:
>>> *future_tbl is null*
>>>
>>> fail:
>>>         /* Do not fail the insert if someone else did a rehash. */
>>>         if (likely(rcu_dereference_raw(tbl->future_tbl))) {
>>>                 printk("future_tbl is there\n");
>>>                 return 0;
>>>         } else {
>>>                 printk("future_tbl is null\n");
>>>         }
>>>
>>> any idea why ?
>>
>> That's presumably because you got a genuine double rehash.
>>
>> Until you post your code we can't really help you.
>>
> i wish i could , but my codes is a big patch for sctp, and this issue
> happens in a special stress test based on this patch.
> im trying to think how i can show you. :)

Simply post it.

--===============8128967928129657533==--

