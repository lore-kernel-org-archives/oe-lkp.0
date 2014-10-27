Content-Type: multipart/mixed; boundary="===============2184294885788273886=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [futex] 76835b0ebf8: -12.1% will-it-scale.per_process_ops
Date: Sun, 26 Oct 2014 19:26:01 -0700
Message-ID: <1414376761.12733.13.camel@linux-t7sj.site>
In-Reply-To: <20141027021822.GH27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2184294885788273886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-10-27 at 10:18 +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> commit 76835b0ebf8a7fe85beb03c75121419a7dec52f0 ("futex: Ensure get_futex=
_key_refs() always implies a barrier")

fwiw I was also able to reproduce similar results, with the hashing
costing (unsurprisingly) around an extra ~10% with the new barrier, not
much we can do about that. In any case these are pretty low level
measurements so shouldn't impact too much. Additionally, any user that
cares about performance will try to avoid incurring futex calls into
kernel space.


--===============2184294885788273886==--

