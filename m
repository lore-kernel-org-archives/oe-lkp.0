Content-Type: multipart/mixed; boundary="===============3668217268832980477=="
MIME-Version: 1.0
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fs] df4c0e36f1: NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
Date: Mon, 02 Nov 2015 22:34:01 +0300
Message-ID: <CAPAsAGzpTM84NEESPt_jY0i-+W2SB37KtW1TXy93e8R2F7rEtw@mail.gmail.com>
In-Reply-To: <56379FDE.6010603@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3668217268832980477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2015-11-02 20:39 GMT+03:00 Dave Hansen <dave.hansen@intel.com>:
> On 11/02/2015 01:32 AM, Andrey Ryabinin wrote:
>> And the major factor here is number 2.
>>
>> In your dmesg:
>> [   67.891156] rbtree testing -> 570841 cycles
>> [   88.609636] augmented rbtree testing
>> [  116.546697] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s!
>> [swapper/0:1]
>>
>>
>> I've tried to reproduce this, and got this:
>> [    0.693574] rbtree testing -> 15513 cycles
>> 570841/15513 =3D 36x times faster.
>>
>> [    1.159450] augmented rbtree testing -> 23675 cycles
>> [    1.864996]
>> It took less than a second, meanwhile in your case it didn't finish in
>> 22 seconds.
>>
>> This makes me think that your host is overloaded and the problem is on
>> your side.
>
> It's probably just a matter of putting some cond_resched()s in the test
> code.

Yes, but is it worthwhile? It's very likely that lockup will just
trigger in another place.

--===============3668217268832980477==--

