Content-Type: multipart/mixed; boundary="===============0123430753909181574=="
MIME-Version: 1.0
From: Eric Dumazet <eric.dumazet@gmail.com>
To: lkp@lists.01.org
Subject: Re: inet: frags: Turn fqdir->dead into an int for old Alphas
Date: Fri, 07 Jun 2019 09:13:09 -0700
Message-ID: <f8908fc1-102e-c02f-6574-56cf053d791e@gmail.com>
In-Reply-To: <20190607153226.gzt4yeq5c5i6bpqd@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============0123430753909181574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/7/19 8:32 AM, Herbert Xu wrote:
> On Fri, Jun 07, 2019 at 08:26:12AM -0700, Eric Dumazet wrote:
>>
>> There is common knowledge among us programmers that bit fields
>> (or bool) sharing a common 'word' need to be protected
>> with a common lock.
>>
>> Converting all bit fields to plain int/long would be quite a waste of me=
mory.
>>
>> In this case, fqdir_exit() is called right before the whole
>> struct fqdir is dismantled, and the only cpu that could possibly
>> change the thing is ourself, and we are going to start an RCU grace peri=
od.
>>
>> Note that first cache line in 'struct fqdir' is read-only.
>> Only ->dead field is flipped to one at exit time.
>>
>> Your patch would send a strong signal to programmers to not even try usi=
ng
>> bit fields.
>>
>> Do we really want that ?
> =

> If this were a bitfield then I'd think it would be safer because
> anybody adding a new bitfield is unlikely to try modifying both
> fields without locking or atomic ops.
> =

> However, because this is a boolean, I can certainly see someone
> else coming along and adding another bool right next to it and
> expecting writes them to still be atomic.
> =

> As it stands, my patch has zero impact on memory usage because
> it's simply using existing padding.  Should this become an issue
> in future, we can always revisit this and use a more appropriate
> method of addressing it.
> =

> But the point is to alert future developers that this field is
> not an ordinary boolean.

Okay, but you added a quite redundant comment.

/* We can't use boolean because this needs atomic writes. */

Should we add a similar comment in front of all bit-fields,
or could we factorize this in a proper Documentation perhaps ?

Can we just add a proper bit-field and not the comment ?

unsigned int dead:1;

This way, next programmer can just apply normal rules to add a new bit.

Thanks !


--===============0123430753909181574==--

