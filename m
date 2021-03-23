Content-Type: multipart/mixed; boundary="===============5955392200157776084=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: lkp@lists.01.org
Subject: [PATCH] drm/i915: Use tasklet_unlock_spin_wait() in __tasklet_disable_sync_once()
Date: Tue, 23 Mar 2021 10:22:21 +0100
Message-ID: <20210323092221.awq7g5b2muzypjw3@flow>
In-Reply-To: <20210322082522.GH32426@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5955392200157776084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The i915 driver has its own tasklet interface which was overseen in the
tasklet rework. __tasklet_disable_sync_once() is a wrapper around
tasklet_unlock_wait(). tasklet_unlock_wait() might sleep, but the i915
wrappers invoke it from non-preemtible contexts with bottom halves disabled.

Use tasklet_unlock_spin_wait() instead which can be invoked from
non-preemptible contexts.

Fixes: da044747401fc ("tasklets: Replace spin wait in tasklet_unlock_wait()=
")
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/i915_gem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_ge=
m.h
index e622aee6e4be9..440c35f1abc9e 100644
--- a/drivers/gpu/drm/i915/i915_gem.h
+++ b/drivers/gpu/drm/i915/i915_gem.h
@@ -105,7 +105,7 @@ static inline bool tasklet_is_locked(const struct taskl=
et_struct *t)
 static inline void __tasklet_disable_sync_once(struct tasklet_struct *t)
 {
 	if (!atomic_fetch_inc(&t->count))
-		tasklet_unlock_wait(t);
+		tasklet_unlock_spin_wait(t);
 }
 =

 static inline bool __tasklet_is_enabled(const struct tasklet_struct *t)
-- =

2.31.0

--===============5955392200157776084==--

