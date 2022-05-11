Content-Type: multipart/mixed; boundary="===============8455551005383279180=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Tue, 10 May 2022 22:06:46 -0400
Message-ID: <e3d60afb-b761-ef91-f73d-5fadc32050d5@redhat.com>
In-Reply-To: <41c08a5371957acac5310a2e608b2e42bd231558.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8455551005383279180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/10/22 21:58, ying.huang(a)intel.com wrote:
> On Tue, 2022-05-10 at 11:05 -0700, Linus Torvalds wrote:
>> [ Adding locking people in case they have any input ]
>>
>> On Mon, May 9, 2022 at 11:23 PM ying.huang(a)intel.com
>> <ying.huang@intel.com> wrote:
>>>> Can you point me to the regression report? I would like to take a look,
>>>> thanks.
>>> https://lore.kernel.org/all/1425108604.10337.84.camel(a)linux.intel.com/
>> +
>> Hmm.
>>
>> That explanation looks believable, except that our qspinlocks
>> shouldn't be spinning on the lock itself, but spinning on the mcs node
>> it inserts into the lock.
> The referenced regression report is very old (in Feb 2015 for 3.16-
> 3.17).  The ticket spinlock was still used at that time.  I believe that
> things become much better after we used qspinlock.  We can test that.

Thank for the info. Qspinlock was merged into mainline since 4.2. So =

ticket spinlock was used on all v3.* kernels. I was wondering why =

qspinlock would have produced such a large performance regression with =

just one lock spinning head waiter. So this is not such a big issue =

after all.

Cheers,
Longman

--===============8455551005383279180==--

