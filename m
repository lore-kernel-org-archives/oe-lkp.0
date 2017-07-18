Content-Type: multipart/mixed; boundary="===============7336210847370261607=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Tue, 18 Jul 2017 08:12:13 -0400
Message-ID: <aae67245-4c9c-f79e-b821-40753e732f65@linux.vnet.ibm.com>
In-Reply-To: <alpine.LRH.2.20.1707181659030.5209@namei.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7336210847370261607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 03:01 AM, James Morris wrote:
> On Thu, 13 Jul 2017, Stefan Berger wrote:
>
>> A file shared by 2 containers, one mapping root to uid=3D1000, the other=
 mapping
>> root to uid=3D2000, will show these two xattrs on the host (init_user_ns=
) once
>> these containers set xattrs on that file.
> I may be missing something here, but what happens when say the uid=3D2000
> container and associated user is deleted from the system, then another is
> created with the same uid?
>
> Won't this mean that you have unexpected capabilities turning up in the
> new container?
>

Yes, that's right. I don't know any solution for that. We would have to =

walk the filesystems and find all 'stale' xattrs with such a uid. This =

is independent of whether the uid is encoded on the name side, as in =

this patch, or on the value side, as in Serge's original proposal. And =

uids of a mapped container root user don't necessarily have to have an =

account on the host so that an account deletion could trigger that.

     Stefan


--===============7336210847370261607==--

