Content-Type: multipart/mixed; boundary="===============2629492976388720670=="
MIME-Version: 1.0
From: James Morris <jmorris@namei.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Wed, 12 Jul 2017 17:59:31 +1000
Message-ID: <alpine.LRH.2.20.1707121754520.1175@namei.org>
In-Reply-To: <1499785511-17192-2-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2629492976388720670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Jul 2017, Stefan Berger wrote:

> +	buflen =3D sizeof("@uid=3D") - 1 + sizeof("4294967295") - 1 + 1;

Why not strlen() here?

-- =

James Morris
<jmorris@namei.org>


--===============2629492976388720670==--

