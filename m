Content-Type: multipart/mixed; boundary="===============4667716396457875461=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/entry] 2bbc68f837: ltp.ptrace08.fail
Date: Tue, 16 Jun 2020 06:22:10 -0700
Message-ID: <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
In-Reply-To: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4667716396457875461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On Jun 16, 2020, at 1:44 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> =

> =EF=BB=BFkernel test robot <rong.a.chen@intel.com> writes:
>> FYI, we noticed the following commit (built with gcc-9):
>> =

>> commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert De=
bug exception to IDTENTRY_DB")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> Is the head of linux.git exposing the same problem or is this an
> intermittent failure, which only affects bisectability?

It sure looks deterministic:

ptrace08.c:62: BROK: Cannot find address of kernel symbol "do_debug"

> =

> Thanks,
> =

>        tglx

--===============4667716396457875461==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxicj48ZGl2IGRp
cj0ibHRyIj48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5PbiBKdW4gMTYsIDIwMjAsIGF0IDE6NDQg
QU0sIFRob21hcyBHbGVpeG5lciAmbHQ7dGdseEBsaW51dHJvbml4LmRlJmd0OyB3cm90ZTo8YnI+
PGJyPjwvYmxvY2txdW90ZT48L2Rpdj48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48ZGl2IGRpcj0i
bHRyIj7vu788c3Bhbj5rZXJuZWwgdGVzdCByb2JvdCAmbHQ7cm9uZy5hLmNoZW5AaW50ZWwuY29t
Jmd0OyB3cml0ZXM6PC9zcGFuPjxicj48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj5GWUks
IHdlIG5vdGljZWQgdGhlIGZvbGxvd2luZyBjb21taXQgKGJ1aWx0IHdpdGggZ2NjLTkpOjwvc3Bh
bj48YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPjwvc3Bhbj48
YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPmNvbW1pdDogMmJi
YzY4ZjgzNzNjMDYzMWViZjEzN2YzNzZmYmVhMDBlODA4NmJlNyAoIng4Ni9lbnRyeTogQ29udmVy
dCBEZWJ1ZyBleGNlcHRpb24gdG8gSURURU5UUllfREIiKTwvc3Bhbj48YnI+PC9ibG9ja3F1b3Rl
PjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dp
dC9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCBtYXN0ZXI8L3NwYW4+PGJyPjwv
YmxvY2txdW90ZT48c3Bhbj48L3NwYW4+PGJyPjxzcGFuPklzIHRoZSBoZWFkIG9mIGxpbnV4Lmdp
dCBleHBvc2luZyB0aGUgc2FtZSBwcm9ibGVtIG9yIGlzIHRoaXMgYW48L3NwYW4+PGJyPjxzcGFu
PmludGVybWl0dGVudCBmYWlsdXJlLCB3aGljaCBvbmx5IGFmZmVjdHMgYmlzZWN0YWJpbGl0eT88
L3NwYW4+PGJyPjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pkl0IHN1cmUg
bG9va3MgZGV0ZXJtaW5pc3RpYzo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48c3BhbiBzdHlsZT0iLXdl
YmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOyBjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBj
b2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7
Ij5wdHJhY2UwOC5jOjYyOiBCUk9LOiBDYW5ub3QgZmluZCBhZGRyZXNzIG9mIGtlcm5lbCBzeW1i
b2wgImRvX2RlYnVnIjwvc3Bhbj48ZGl2Pjxmb250IGNvbG9yPSIjMDAwMDAwIj48c3BhbiBzdHls
ZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgLXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OiBh
dXRvOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48YnI+PC9zcGFuPjwv
Zm9udD48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48ZGl2IGRpcj0ibHRyIj48c3Bhbj48L3NwYW4+
PGJyPjxzcGFuPlRoYW5rcyw8L3NwYW4+PGJyPjxzcGFuPjwvc3Bhbj48YnI+PHNwYW4+ICZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO3RnbHg8L3NwYW4+PGJyPjwvZGl2
PjwvYmxvY2txdW90ZT48L2Rpdj48L2JvZHk+PC9odG1sPg==
--===============4667716396457875461==--

