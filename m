Content-Type: multipart/mixed; boundary="===============6898859018829271728=="
MIME-Version: 1.0
From: James Morris <jmorris@namei.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Tue, 18 Jul 2017 17:01:36 +1000
Message-ID: <alpine.LRH.2.20.1707181659030.5209@namei.org>
In-Reply-To: <29fdda5e-ed4a-bcda-e3cc-c06ab87973ce@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6898859018829271728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jul 2017, Stefan Berger wrote:

> A file shared by 2 containers, one mapping root to uid=3D1000, the other =
mapping
> root to uid=3D2000, will show these two xattrs on the host (init_user_ns)=
 once
> these containers set xattrs on that file.

I may be missing something here, but what happens when say the uid=3D2000 =

container and associated user is deleted from the system, then another is =

created with the same uid?

Won't this mean that you have unexpected capabilities turning up in the =

new container?

-- =

James Morris
<jmorris@namei.org>


--===============6898859018829271728==--

