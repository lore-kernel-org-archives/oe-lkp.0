Content-Type: multipart/mixed; boundary="===============8779717891292899755=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/pat: Fix off-by-one bugs in interval tree search
Date: Sun, 01 Dec 2019 09:01:15 -0800
Message-ID: <20191201170115.molqadzebqo2sldu@linux-p48b>
In-Reply-To: <20191201144947.GA4167@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8779717891292899755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 01 Dec 2019, Ingo Molnar wrote:
>So the correct parameter to use in the interval tree searches is not
>'end' but 'end-1'.

Yes absolutely, I overlooked this in the final conversion. Going through so=
me
older conversions, I had this end-1 at one point. Lookups need half-open in=
tervals,
consistent with what memtype_interval_end() does.

[...]

>Patch is only lightly tested, so take care. (Patch is emphatically not
>signed off yet, because I spent most of the day on this and I don't yet
>trust my fix - all of the affected sites need to be reviewed more
>carefully.)

As a general note, this is rather consistent with how all interval-tree
users that need [a,b) nodes use the api.

Thanks,
Davidlohr
--===============8779717891292899755==--

