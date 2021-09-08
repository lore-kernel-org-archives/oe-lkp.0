Content-Type: multipart/mixed; boundary="===============7637401220615872117=="
MIME-Version: 1.0
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: lkp@lists.01.org
Subject: [PATCH net] mctp: perform route destruction under RCU read lock
Date: Wed, 08 Sep 2021 12:13:10 +0800
Message-ID: <20210908041310.4014458-1-jk@codeconstruct.com.au>
In-Reply-To: <20210908030319.GA839@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7637401220615872117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kernel test robot reports:

  [  843.509974][  T345] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [  843.524220][  T345] WARNING: suspicious RCU usage
  [  843.538791][  T345] 5.14.0-rc2-00606-g889b7da23abf #1 Not tainted
  [  843.553617][  T345] -----------------------------
  [  843.567412][  T345] net/mctp/route.c:310 RCU-list traversed in non-rea=
der section!!

- we're missing the rcu read lock acquire around the destruction path.

This change adds the acquire/release - the path is already atomic, and
we're using the _rcu list iterators.

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 net/mctp/route.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index 5265525011ad..5ca186d53cb0 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -1083,8 +1083,10 @@ static void __net_exit mctp_routes_net_exit(struct n=
et *net)
 {
 	struct mctp_route *rt;
 =

+	rcu_read_lock();
 	list_for_each_entry_rcu(rt, &net->mctp.routes, list)
 		mctp_route_release(rt);
+	rcu_read_unlock();
 }
 =

 static struct pernet_operations mctp_net_ops =3D {
-- =

2.30.2

--===============7637401220615872117==--

