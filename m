Content-Type: multipart/mixed; boundary="===============5078864238583034073=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [vfs] 662aa027bda: -7.2% will-it-scale.scalability
Date: Tue, 27 May 2014 11:19:40 -0700
Message-ID: <5384D73C.2030109@intel.com>
In-Reply-To: <5384B634.7080902@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5078864238583034073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/27/2014 08:58 AM, Jet Chen wrote:
> 9f498c77b4332b4  662aa027bdaa082aa3dd21886
> ---------------  -------------------------
>       0.63 ~ 0%      -7.2%       0.58 ~ 0%  TOTAL will-it-scale.scalabili=
ty
>   12861563 ~ 0%      -1.1%   12715565 ~ 0%  TOTAL will-it-scale.per_proce=
ss_ops

There's something funky here.

What are the numbers being factored in to 'will-it-scale.scalability'
and 'will-it-scale.per_process_ops'?  Could you share the raw csv's that
will-it-scale generated?

Since 'per_process_ops' is only off by 1.1%, my suspicion is that some
consistent skew on the 1-process case is getting magnified in to the
scalability number.

--===============5078864238583034073==--

