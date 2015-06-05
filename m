Content-Type: multipart/mixed; boundary="===============7135040499095392461=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH 1/3] choose cgroup-bin over cgroup-tools
Date: Fri, 05 Jun 2015 15:01:36 +0300
Message-ID: <1433505698-5883-1-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7135040499095392461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

cgroup-tools is relatively new rename of
cgroup-bin package. Use cgroup-bin for wider
compatability (ubuntu and older debian)

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 distro/debian/autotest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/distro/debian/autotest b/distro/debian/autotest
index f3ee0a4..a31a896 100644
--- a/distro/debian/autotest
+++ b/distro/debian/autotest
@@ -1,6 +1,6 @@
 build-essential
 python-simplejson
-cgroup-tools
+cgroup-bin
 libtool
 apt-file
 sg3-utils
-- =

2.1.4


--===============7135040499095392461==--

