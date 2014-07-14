Content-Type: multipart/mixed; boundary="===============4087188241173751263=="
MIME-Version: 1.0
From: H. Peter Anvin <hpa@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, kaslr] BUG: unable to handle kernel NULL pointer dereference at 00000008
Date: Mon, 14 Jul 2014 15:47:57 -0700
Message-ID: <53C45E1D.3060607@linux.intel.com>
In-Reply-To: <CAGXu5jK2GWXkReO9fKg7aFE5Ds1xyYw2weDpYOvvQntymKn78A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4087188241173751263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/14/2014 02:53 PM, Kees Cook wrote:
> Hi,
> =

> On Sat, Jul 5, 2014 at 7:23 PM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
>> Hi Kees,
>>
>> This bug is a bit old (and not very reproducible), however it's still
>> showing up in the upstream and linux-next trees.
> =

> I'm still unable to reproduce this. It feels like it's something
> specific to the qemu loader, maybe?
> =

> -Kees

The Qemu loader is about as dirt simple as it gets...

	-hpa



--===============4087188241173751263==--

