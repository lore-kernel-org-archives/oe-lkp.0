Content-Type: multipart/mixed; boundary="===============9212661363249189835=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: Re: [crypto] BUG: unable to handle kernel paging request at ffff88000bb88000
Date: Sun, 29 Jun 2014 19:43:35 +0000
Message-ID: <42550233.Kxs179MjQV@myon.chronox.de>
In-Reply-To: <20140629145246.GA9134@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============9212661363249189835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Sonntag, 29. Juni 2014, 22:52:46 schrieb Fengguang Wu:

Hi Fengguang,

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is

May I ask whether there is anything special in your kernel config?

This very bug should have been triggered already in all previous code level=
s! =

I am seriously wondering why this bug was not triggered before -- does kall=
oc =

somehow allocates more memory than you requested? And only your specific =

kernel config made kalloc to allocate the exact amount of memory that was =

requested?

The background can be summarized by the following: the scratchpad->temp buf=
fer =

(i.e. the memory location immediately before the tfm variable upon which th=
e =

kernel crashed) is the buffer that the BCC function operates on. BCC operat=
es =

blockwise. drbg_statelen(drbg) is sufficient when the DRBG state length is =
a =

multiple of the block size. For AES192 (and maybe other ciphers) this is no=
t =

correct and the length for temp is insufficient (yes, that also means for s=
uch =

ciphers, the final output of all BCC rounds are truncated before used to =

update the state of the DRBG!!).

The DRBG code that triggered the bug defined the buffer to be drbg_statelen=
() =

in size. As described, the bug therefore triggered with the AES192 cipher. =
The =

patch is simply to enlarge the buffer by blocklen. This ensures that we hav=
e =

no memory corruption.

An official patch is created and released shortly.

More and more I look into and work with SP800-90A, I feel that at least the =

CTR DRBG and to a lesser degree the Hash DRBG have severe shortcomings. =

Throwing away information derived from the seed by the aforementioned =

truncation is definitely not wise. This truncation is in addition to other =

very odd operations on the seed definitely result in a loss of entropy IMHO.

Though, thanks a lot for the bug report and your testing.

-- =

Ciao
Stephan

--===============9212661363249189835==--

